import SwiftUI

struct PercevyTabView: View {
    @State private var selectedTab: TabType = .chatList
    @Namespace var circleNamespace

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ChatListView().tag(TabType.chatList)
                MoreView().tag(TabType.more)
            }

            tabOverlay
        }
    }

    private var tabOverlay: some View {
        HStack {
            TabButton<SelectedTabButton, Image>(
                current: $selectedTab,
                tabType: .chatList,
                action: chatBallonButtonTapped,
                selected: {
                    SelectedTabButton(text: "Chats", id: circleNamespace)
                },
                unselected: { Image(.chatBalloon) }
            )

            TabButton<SelectedTabButton, Image>(
                current: $selectedTab,
                tabType: .more,
                action: moreHorizontalButtonTapped,
                selected: {
                    SelectedTabButton(text: "More", id: circleNamespace)
                },
                unselected: { Image(.moreHorizontal) }
            )
        }
        .animation(.spring, value: selectedTab)
    }
}

// MARK: Button actions
private extension PercevyTabView {
    func chatBallonButtonTapped() { self.selectedTab = .chatList }

    func moreHorizontalButtonTapped() { self.selectedTab = .more }
}

// MARK: 커스텀 Tab Button
private struct TabButton<SelectedView: View, UnselectedView: View>: View {
    @Binding private var selectedTabType: TabType
    let tabType: TabType

    let action: () -> Void
    let selectedView: () -> SelectedView
    let unselectedView: () -> UnselectedView

    fileprivate init(
        current selectedTabType: Binding<TabType>,
        tabType: TabType,
        action: @escaping () -> Void,
        selected selectedView: @escaping () -> SelectedView,
        unselected unselectedView: @escaping () -> UnselectedView
    ) {
        self._selectedTabType = selectedTabType
        self.tabType = tabType
        self.action = action
        self.selectedView = selectedView
        self.unselectedView = unselectedView
    }

    var body: some View {
        HStack {
            Spacer()
            if selectedTabType == tabType {
                AnyView(selectedView())
            }
            else { AnyView(unselectedView()).onTapGesture(perform: action) }
            Spacer()
        }
    }
}

// MARK: Selected Custom Tab Button
private struct SelectedTabButton: View {
    private let text: String
    let nameSpaceID: Namespace.ID

    init(
        text: String,
        id nameSpaceID: Namespace.ID
    ) {
        self.text = text
        self.nameSpaceID = nameSpaceID
    }

    var body: some View {
        VStack {
            Text(text).font(.percevyFont(.body2))
            Circle()
                .frame(width: 6, height: 6)
                .matchedGeometryEffect(id: "circle", in: nameSpaceID)
        }
    }
}

// MARK: Tab Type
private enum TabType: Int {
    case chatList = 0
    case more = 1
}

#Preview {
    PercevyTabView()
}
