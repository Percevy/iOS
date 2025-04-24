import SwiftUI

@main
struct PercevyApp: App {
    @StateObject private var appRootManager = AppRootManager()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .walkthrough: WalkthroughView()
                case .main: PercevyTabView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
