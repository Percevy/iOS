import SwiftUI
import PhotosUI
import OSLog

class SetupProfileViewModel: ObservableObject {
    @Published var profile: Profile
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet { loadImageFromSelectedPhoto() }
    }

    init(profile: Profile = Profile()) { self.profile = profile }

    var firstNameBinding: String {
        get { profile.firstName }
        set { profile.updateFirstName(to: newValue) }
    }
    
    var lastNameBinding: String {
        get { profile.lastName }
        set { profile.updateLastName(to: newValue) }
    }

    var avatarImageBinding: Data? {
        get { profile.avatarImageData }
        set { profile.updateAvatarImageData(to: newValue) }
    }

    private func loadImageFromSelectedPhoto() {
        Task {
            do {
                let data = try await selectedPhoto?.loadTransferable(type: Data.self)
                await MainActor.run { self.profile.updateAvatarImageData(to: data) }
            } catch {
                os_log(.error, "\(#file) \(#function) \(error.localizedDescription)")
            }
        }
    }
}
