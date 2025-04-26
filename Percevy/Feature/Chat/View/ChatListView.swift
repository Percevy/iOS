import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()
    @State private var isNewChatPresented: Bool = false
    @State private var isChatListRowSelected: Bool = false
    @State private var isEditMode: EditMode = .inactive

    var body: some View {
        VStack {
            SearchBarView(text: $viewModel.inputTextBinding)
                .padding(.top, 16)
                .padding(.horizontal, 24)

            List {
                ForEach($viewModel.chats, id: \.self) { chat in
                    ChatListRowView(chat: chat)
                        .onTapGesture {
                            self.isChatListRowSelected = true
                        }
                        .padding(.horizontal, 8)
                }
                .onDelete(perform: removeRow)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .toolbar { toolBarContents }
        .background(Color.background)
        .navigationDestination(
            isPresented: $isNewChatPresented,
            destination: { ChatView() }
        )
        .navigationDestination(
            isPresented: $isChatListRowSelected,
            destination: { ChatView() }
        )
        .onDisappear(perform: { isEditMode = .inactive })
        .environment(\.editMode, $isEditMode)
    }

    @ToolbarContentBuilder
    private var toolBarContents: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Chats")
                .font(.percevyFont(.subHeading1))
                .foregroundStyle(.neutralActive)
        }

        ToolbarItem(placement: .topBarTrailing) {
            Button(action: newChatButtonTapped) {
                Image(.newChat)
            }
        }

        ToolbarItem(placement: .topBarTrailing) {
            Button(action: editChatListButtonTapped) {
                Image(.editChatList)
            }
        }
    }
}

// MARK: Button actions
extension ChatListView {
    private func newChatButtonTapped() { self.isNewChatPresented = true }

    private func editChatListButtonTapped() {
        withAnimation {
            isEditMode = (isEditMode == .active) ? .inactive : .active
        }
    }

    private func removeRow(at offsets: IndexSet) {
        viewModel.chats.remove(atOffsets: offsets)
    }
}

#Preview {
    TabView {
        NavigationStack {
            ChatListView()
        }
        .tabItem {
            Image(.chatBalloon)
        }
    }
}
