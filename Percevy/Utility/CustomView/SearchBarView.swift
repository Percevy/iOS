import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(.search)
                .padding(.vertical, 6)
                .padding(.horizontal, 8)

            TextField(
                "Search",
                text: $text
            )
        }
        .percevyTextFieldModifier()
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
