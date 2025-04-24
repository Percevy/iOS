import SwiftUI
import PhotosUI

struct SetupProfileView: View {
    @EnvironmentObject private var appRootManager: AppRootManager

    @StateObject var viewModel = SetupProfileViewModel()

    @State private var isAddProfileImageSheetPresented: Bool = false
    @State private var isPhotosPickerPresented: Bool = false

    var body: some View {
        VStack {
            avatarSetupView.padding(.top, 46)
            firstNameTextField.padding(.top, 32)
            lastNameTextField.padding(.top, 12)
            
            Spacer()

            saveButton.padding(.bottom, 20)
        }
        .padding(.horizontal, 24)
        .navigationTitle(ConstantText.navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "프로필 사진 설정",
            isPresented: $isAddProfileImageSheetPresented,
            titleVisibility: .visible
        ) {
            Button("앨범에서 사진 선택") { self.isPhotosPickerPresented = true }
            Button("기본 이미지 적용") { viewModel.selectedPhoto = nil }
            Button("취소", role: .cancel) { /* Close ActionSheet */ }
        }
        .photosPicker(
            isPresented: $isPhotosPickerPresented,
            selection: $viewModel.selectedPhoto,
            matching: .images
        )
    }
    
    private var avatarSetupView: some View {
        // + 버튼을 제외한 아바타는 재활용 가능해보임
        ZStack(alignment: .bottomTrailing) {
            AvatarView(imageData: $viewModel.avatarImageBinding )
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
    private func addProfileImageButtonTapped() {
        self.isAddProfileImageSheetPresented = true
    }
    
    private func saveButtonAction() {
        self.appRootManager.changeRoot(to: .main)
    }
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
