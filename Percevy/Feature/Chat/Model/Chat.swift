import Foundation

struct Chat {
    private(set) var title: String
    private(set) var summary: String
    private(set) var recentDate: Date

    mutating func updateTitle(to title: String) { self.title = title }
    mutating func updateSummary(to summary: String) { self.summary = summary }
    mutating func updateRecentDate(to date: Date) { self.recentDate = date }

    func getDateSummary() -> String {
        let calendar = Calendar.current
        let now = Date()
        let daysDifference = calendar.dateComponents(
            [.day],
            from: calendar.startOfDay(for: recentDate),
            to: calendar.startOfDay(for: now)
        ).day ?? 0

        if daysDifference == 1 {
            return "yesterday"
        } else if daysDifference > 1 && daysDifference < 7 {
            return "\(daysDifference) days ago"
        } else if daysDifference >= 7 {
            let formatter = DateFormatter()
            formatter.dateFormat = "M/d"
            return formatter.string(from: recentDate)
        } else {
            return "now"
        }
    }
}
