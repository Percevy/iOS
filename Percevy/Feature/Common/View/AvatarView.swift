import SwiftUI

struct AvatarView: View {
    @Binding var imageData: Data?

    var body: some View {
        Circle()
            .fill(Color.neutralOffwhite)
            .overlay {
                if let image = Image(data: imageData) {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                } else { Image(.avatar) }
            }
    }
}

#Preview {
    AvatarView(imageData: .constant(nil))
}
