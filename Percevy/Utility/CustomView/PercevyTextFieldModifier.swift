import SwiftUI

private struct PercevyTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.percevyFont(.body1))
            .padding(.leading, 8)
            .padding(.vertical, 6)
            .frame(minHeight: 36)
            .background(
                .neutralOffWhite,   // TODO: 다크모드 대응
                in: RoundedRectangle(cornerRadius: 4)
            )
    }
}

extension View {
    func percevyTextFieldModifier() -> some View {
        self.modifier(PercevyTextFieldModifier())
    }
}
