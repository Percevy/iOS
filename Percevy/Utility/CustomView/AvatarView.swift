import SwiftUI

struct AvatarView: View {
    var body: some View {
        // 1. 저장된 이미지가 있다면 불러오기
        
        
        // 2. 없다면 기본 프로필 띄우기
        Circle()
            .fill(Color.neutralOffWhite)
            .overlay { Image(.avatar) }
    }
}

#Preview {
    AvatarView()
}
