import Foundation

class SetupProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    
    init() { self.profile = nil }
    
    var firstNameBinding: String {
        get { profile?.firstName ?? "" }
        set { profile?.updateFirstName(to: newValue) }
    }
    
    var lastNameBinding: String {
        get { profile?.lastName ?? "" }
        set { profile?.updateLastName(to: newValue) }
    }
}
