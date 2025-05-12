import SwiftUI

struct ChatBallon: View {
    let chatter: Chatter
    let text: String
    let date: Date

    var body: some View {
        HStack {
            if chatter == .me { Spacer() }

            VStack(alignment: chatter.alignment, spacing: 4) {
                Text(text)
                    .font(.percevyFont(.body2))
                    .foregroundStyle(chatter.tintColor)

                Text(makeDateToTime(date: date))
                    .font(.percevyFont(.metaData3))
                    .foregroundStyle(chatter.tintColor)
            }
            .padding(10)
            .background(chatter.backgroundColor)
            .clipShape(
                RoundedCorners(
                    topLeading: 16,
                    topTrailing: 16,
                    bottomLeading: chatter == .me ? 16 : 0,
                    bottomTrailing: chatter == .me ? 0 : 16
                )
            )

            if chatter == .other { Spacer() }
        }
        .padding(.top, 12)
    }

    private func makeDateToTime(date: Date) -> String {
        return date.formatted(date: .numeric, time: .shortened)
    }
}

#Preview {
    ChatBallon(
        chatter: .me,
        text: "Very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Text",
        date: Date()
    )
}
