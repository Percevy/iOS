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
            .padding(.horizontal, ConstantSize.contentPaddingHorizontal.rawValue)
            .navigationDestination(isPresented: $isStartMessagingButtonTapped) {
                SetupProfileView()
            }
        }
    }
    
    var illustrationImage: some View {
        Image(.illustration)
            .frame(
                width: ConstantSize.illustrationWidth.rawValue,
                height: ConstantSize.illustrationHeight.rawValue
            )
            .padding(.top, ConstantSize.illustrationOffsetTop.rawValue)
    }
    
    var walktrhoughBodyText: some View {
        Text(ConstantText.walkthroughBody.rawValue)
            .foregroundStyle(.brandBackground)  // FIXME: 다크모드에서 색이 바뀌어야 됨
            .font(.percevyFont(.heading2))
            .multilineTextAlignment(.center)
            .padding(.top, ConstantSize.walkthroughBodyOffsetTop.rawValue)
    }
    
    var startMessagingButton: some View {
        Button(
            ConstantText.primaryButtonText.rawValue,
            action: startMessagingButtonAction
        )
        .buttonStyle(.primary)
        .padding(.bottom, ConstantSize.startMessagingButtonOffsetBottom.rawValue)
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
    private enum ConstantSize: CGFloat {
        case contentPaddingHorizontal = 24
        case illustrationWidth = 262
        case illustrationHeight = 271
        case illustrationOffsetTop = 102 // 45(Navigation bar bottom to illustration image) + 57(Status bar to Navigation bottom)
        case walkthroughBodyOffsetTop = 42
        case startMessagingButtonOffsetBottom = 20
    }
    
    private enum ConstantText: String {
        case walkthroughBody = "Connect easily with\nyour family and friends\nover countries"
        case primaryButtonText = "Start Messaging"
    }
}

#Preview {
    WalkthroughView()
}
