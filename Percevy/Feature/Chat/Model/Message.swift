import SwiftUI

struct Message: Identifiable, Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool { return lhs.id == rhs.id }

    var id: UUID = UUID()

    let chatter: Chatter
    let text: String
    let date: Date
}

enum Chatter {
    case me
    case other

    var alignment: HorizontalAlignment {
        switch self {
        case .me: return .trailing
        case .other: return .leading
        }
    }

    var tintColor: Color {
        switch self {
        case .me: return .white
        case .other: return .black
        }
    }

    var backgroundColor: Color {
        switch self {
        case .me: return .brandDefault
        case .other: return .white
        }
    }
}
