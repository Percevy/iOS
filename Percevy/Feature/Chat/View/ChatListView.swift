import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()

    var body: some View {
        VStack {
            SearchBarView(text: $viewModel.inputTextBinding)
                .padding(.top, 16)
                .padding(.horizontal, 24)

            List {
                ForEach($viewModel.chats, id: \.self) { chat in
                    ChatListRow(chat: chat)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .padding(.horizontal, 8)
        }
        .toolbar { toolBarContents }
        .background(Color.background)
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
    private func newChatButtonTapped() { }

    private func editChatListButtonTapped() { }
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
