import SwiftUI

struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()

    var body: some View {
        Text("ChatListView")
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

#Preview {
    ChatListView()
}
