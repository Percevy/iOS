import Foundation

final class AppRootManager: ObservableObject {
    @Published private(set) var currentRoot: AppRoot = .walkthrough

    enum AppRoot {
        case walkthrough
        case main
    }

    func changeRoot(to appRoot: AppRoot) {
        self.currentRoot = appRoot
    }
}
