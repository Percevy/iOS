import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.percevyFont(.subHeading2))
                .foregroundColor(.neutralOffWhite)  // FIXME: 다크모드 대응
                .frame(maxWidth: .infinity, minHeight: 28)
                .padding(.vertical, 12)
        }
        .background(Color.brandDefault, in: RoundedRectangle(cornerRadius: 30)) // FIXME: 다크모드 대응
    }
}
