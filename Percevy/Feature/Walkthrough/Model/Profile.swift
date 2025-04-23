import Foundation

struct Profile {
    private(set) var firstName: String = ""
    private(set) var lastName: String = ""
    private(set) var avatarImageData: Data? = nil
    
    mutating func updateFirstName(to firstName: String) { self.firstName = firstName }
    mutating func updateLastName(to lastName: String) { self.lastName = lastName }
    mutating func updateAvatarImageData(to data: Data?) { self.avatarImageData = data }
}
