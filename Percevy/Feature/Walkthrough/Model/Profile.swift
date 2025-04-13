import Foundation

struct Profile {
    private(set) var firstName: String = ""
    private(set) var lastName: String? = nil
    private(set) var avatarImage: Data? = nil
    
    mutating func updateFirstName(to firstName: String) { self.firstName = firstName }
    mutating func updateLastName(to lastName: String) { self.lastName = lastName }
    mutating func updateAvatarURL(_ data: Data) { self.avatarImage = data }
}
