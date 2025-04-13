import SwiftUI

struct WalkthroughView: View {
    @State private var isStartMessagingButtonTapped = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                illustrationImage.padding(.top, 102)
                walktrhoughBodyText.padding(.top, 42)
                Spacer()
                startMessagingButton.padding(.bottom, 20)
            }
            .padding(.horizontal, 24)
            .navigationDestination(isPresented: $isStartMessagingButtonTapped) {
                SetupProfileView()
            }
        }
    }
    
    var illustrationImage: some View {
        Image(.illustration)
            .frame(
                width: ConstantSize.illustrationWidth,
                height: ConstantSize.illustrationHeight
            )
    }
    
    var walktrhoughBodyText: some View {
        Text(ConstantText.walkthroughBody)
            .foregroundStyle(.brandBackground)  // FIXME: 다크모드에서 색이 바뀌어야 됨
            .font(.percevyFont(.heading2))
            .multilineTextAlignment(.center)
    }
    
    var startMessagingButton: some View {
        Button(
            ConstantText.primaryButtonText,
            action: startMessagingButtonAction
        )
        .buttonStyle(.primary)
    }
}

// MARK: - Functions
extension WalkthroughView {
    private func startMessagingButtonAction() {
        self.isStartMessagingButtonTapped = true
    }
}


// MARK: - Constant value
extension WalkthroughView {
    private enum ConstantSize {
        static let illustrationWidth: CGFloat = 262
        static let illustrationHeight: CGFloat = 271
    }
    
    private enum ConstantText {
        static let walkthroughBody = "Connect easily with\nyour family and friends\nover countries"
        static let primaryButtonText = "Start Messaging"
    }
}

#Preview {
    WalkthroughView()
}
