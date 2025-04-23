import SwiftUI

struct SetupProfileView: View {
    @ObservedObject var viewModel = SetupProfileViewModel()
    
    var body: some View {
        VStack {
            avatarSetupView.padding(.top, 46)
            firstNameTextField.padding(.top, 32)
            lastNameTextField.padding(.top, 12)
            
            Spacer()
            
            saveButton.padding(.bottom, 20)
            
            // 확인을 누르는 시점에 유저의 정보를 코어데이터에 저장함
            // 이 때 이미지는 캐싱함
                // 스킴은 어떻게 규칙을 정하지?
        }
        .navigationTitle(ConstantText.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 24)
    }
    
    private var avatarSetupView: some View {
        // + 버튼을 제외한 아바타는 재활용 가능해보임
        ZStack(alignment: .bottomTrailing) {
            AvatarView()
            Button(action: addProfileImageButtonTapped) {
                Image(.addIcon).padding(.all, 6)
            }
        }
        .frame(width: 100, height: 100)
    }
    
    private var firstNameTextField: some View {
        TextField(
            ConstantText.firstNamePlaceholder,
            text: $viewModel.firstNameBinding
        )
        .percevyTextFieldModifier()
    }
    
    private var lastNameTextField: some View {
        TextField(
            ConstantText.lastNamePlaceholder,
            text: $viewModel.lastNameBinding
        )
        .percevyTextFieldModifier()
    }
    
    private var saveButton: some View {
        Button(
            ConstantText.saveButtonText,
            action: saveButtonAction
        )
        .buttonStyle(.primary)
    }
}

extension SetupProfileView {
    /// ## Action (사진 선택, 사진 촬영, 사진 제거)
    ///
    /// ### 사진 선택
    /// - 갤러리 열어서 사진 가져오기
    ///
    /// ### 사진 촬영
    /// - 카메라 열어서 사진 촬영하기(셀카모드 자동고정)
    ///
    /// ### 사진 제거하기
    /// - 액션을 선택하면 확인 알림이 뜸
    /// - 확인을 누르면 기본 이미지로 변경
    private func addProfileImageButtonTapped() { }
    
    private func saveButtonAction() { }
}

extension SetupProfileView {
    private enum ConstantText {
        static let firstNamePlaceholder = "First Name (Required)"
        static let lastNamePlaceholder = "Last Name (Optional)"
        static let saveButtonText = "Save"
        static let navigationTitle = "Your Profile"
    }
}

#Preview {
    NavigationStack {
        SetupProfileView()
    }
}
