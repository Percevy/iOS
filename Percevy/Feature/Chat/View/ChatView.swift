import SwiftUI

struct ChatView: View {
    @StateObject var viewModel = ChatViewModel()
    @State var typeMessage: String = ""

    var body: some View {
        VStack {
            messagingView
            messageToolbar
        }
        .percevyNavigationBar(title: viewModel.messagesSummary)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: searchButtonTapped) { Image(.search) }
            }
        }
        .background(.neutralOffwhite)
    }

    private var messagingView: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                ForEach(viewModel.messages) { message in
                    ChatBallon(
                        chatter: message.chatter,
                        text: message.text,
                        date: message.date
                    )
                    .id(message.id)
                }
            }
            .padding(.horizontal, 10)
            .onChange(of: viewModel.messages) { messages in
                guard let lastMessage = messages.last else { return }

                withAnimation {
                    proxy.scrollTo(lastMessage.id, anchor: .bottom)
                }
            }
        }
    }

    private var messageToolbar: some View {
        HStack(spacing: 12) {
            Button(action: addButtonTapped) { Image(.addIcon) }
            TextField("Type your message", text: $typeMessage)
                .percevyTextFieldModifier()
                .onSubmit(sendButtonTapped)
            Button(action: sendButtonTapped) { Image(.send) }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(.white)
    }
}

// MARK: - Button actions
extension ChatView {
    func searchButtonTapped() {
        
    }

    func addButtonTapped() {

    }

    func sendButtonTapped() {
        viewModel.addMessage(by: .me, message: typeMessage)
        viewModel.addReplyMessage()
        typeMessage = ""
    }
}

#Preview {
    NavigationStack { ChatView() }
}
