import Foundation

final class ChatListViewModel: ObservableObject {
    // TODO: 프리뷰에서 Testable할 수 있도록 수정하기
    @Published var chats: [Chat] = [
        Chat(title: "대화 제목1", summary: "대화 요약 1", recentDate: Date()),
        Chat(title: "대화 제목2", summary: "대화 요약 2", recentDate: Date()),
        Chat(title: "대화 제목3", summary: "대화 요약 3", recentDate: Date())
    ]
    @Published private var inputText: String = ""

    var inputTextBinding: String {
        get { inputText }
        set { updateInputText(to: newValue) }
    }
}

// MARK: Functions
extension ChatListViewModel {
    func getChats(at index: Int) -> Chat {
        // Index 오류 방지
        return chats[index]
    }

    private func updateInputText(to inputText: String) {
        self.inputText = inputText
    }
}
