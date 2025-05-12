import Foundation

final class ChatViewModel: ObservableObject {
    @Published var messagesSummary: String = "Chat Summary"
    @Published var messages: [Message] = []

    func addMessage(by sender: Chatter, message: String) {
        let newMessage = Message(chatter: sender, text: message, date: Date())
        messages.append(newMessage)
    }

    func addReplyMessage(message: String = "Hello") {
        let newMessage = Message(chatter: .other, text: message, date: Date())
        messages.append(newMessage)
    }
}
