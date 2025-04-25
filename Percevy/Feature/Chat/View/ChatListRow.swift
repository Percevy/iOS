import SwiftUI

struct ChatListRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(chat.title)
                    .font(.percevyFont(.body1))
                    .foregroundStyle(.neutralActive)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(chat.getDateSummary())
                    .font(.percevyFont(.metaData2))
                    .foregroundStyle(.neutralWeak)
            }
            .padding(.bottom, 1)

            Text(chat.summary)
                .font(.percevyFont(.metaData1))
                .foregroundStyle(.neutralDisable)
                .lineLimit(1)
        }
    }
}

#Preview {
    @State var previewChat = Chat(
        title: "Test title",
        summary: "Test summary. summary support it until 2 lines goes beyond. let's see how it looks",
        recentDate: Date()
    )

    ChatListRow(chat: $previewChat)
}
