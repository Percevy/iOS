import SwiftUI

struct WalkthroughView: View {
    @State private var isStartMessagingButtonTapped = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                illustrationImage
                walktrhoughBodyText
                Spacer()
                startMessagingButton
            }
            .padding(.horizontal, ConstantSize.contentPaddingHorizontal)
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
            .padding(.top, ConstantSize.illustrationOffsetTop)
    }
    
    var walktrhoughBodyText: some View {
        Text(ConstantText.walkthroughBody)
            .foregroundStyle(.brandBackground)  // FIXME: 다크모드에서 색이 바뀌어야 됨
            .font(.percevyFont(.heading2))
            .multilineTextAlignment(.center)
            .padding(.top, ConstantSize.walkthroughBodyOffsetTop)
    }
    
    var startMessagingButton: some View {
        Button(
            ConstantText.primaryButtonText,
            action: startMessagingButtonAction
        )
        .buttonStyle(.primary)
        .padding(.bottom, ConstantSize.startMessagingButtonOffsetBottom)
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
        static let contentPaddingHorizontal: CGFloat = 24
        static let illustrationWidth: CGFloat = 262
        static let illustrationHeight: CGFloat = 271
        static let illustrationOffsetTop: CGFloat = 102 // 45(Navigation bar bottom to illustration image) + 57(Status bar to Navigation bottom)
        static let walkthroughBodyOffsetTop: CGFloat = 42
        static let startMessagingButtonOffsetBottom: CGFloat = 20
    }
    
    private enum ConstantText {
        static let walkthroughBody = "Connect easily with\nyour family and friends\nover countries"
        static let primaryButtonText = "Start Messaging"
    }
}

#Preview {
    WalkthroughView()
}
