import Foundation

struct Profile {
    private(set) var firstName: String
    private(set) var lastName: String?
    private(set) var avatarImage: Data?
    
    init(firstName: String, lastName: String?, avatarImage: Data?) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatarImage = avatarImage
    }
    
    mutating func updateAvatarURL(_ data: Data) { self.avatarImage = data }
}
