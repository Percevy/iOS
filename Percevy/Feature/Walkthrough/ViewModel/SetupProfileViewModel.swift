import SwiftUI
import PhotosUI
import OSLog

class SetupProfileViewModel: ObservableObject {
    @Published private var profile: Profile
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet { loadImageData(from: self.selectedPhoto) }
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

    private func loadImageData(from selectedPhoto: PhotosPickerItem?) {
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
