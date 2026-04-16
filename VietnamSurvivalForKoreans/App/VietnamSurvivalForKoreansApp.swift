import SwiftUI

@main
struct VietnamSurvivalForKoreansApp: App {
    @StateObject private var store = PhraseStore()
    @StateObject private var favoritesManager = FavoritesManager()
    @StateObject private var speechManager = SpeechManager()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(store)
                .environmentObject(favoritesManager)
                .environmentObject(speechManager)
        }
    }
}
