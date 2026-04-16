import Foundation

final class FavoritesManager: ObservableObject {
    @Published private(set) var favoriteIDs: Set<String> = []

    private let storageKey = "favoritePhraseIDs"

    init() {
        loadFavorites()
    }

    func isFavorite(_ phrase: Phrase) -> Bool {
        favoriteIDs.contains(phrase.id)
    }

    func toggle(_ phrase: Phrase) {
        if favoriteIDs.contains(phrase.id) {
            favoriteIDs.remove(phrase.id)
        } else {
            favoriteIDs.insert(phrase.id)
        }

        saveFavorites()
    }

    private func loadFavorites() {
        let savedIDs = UserDefaults.standard.stringArray(forKey: storageKey) ?? []
        favoriteIDs = Set(savedIDs)
    }

    private func saveFavorites() {
        UserDefaults.standard.set(Array(favoriteIDs), forKey: storageKey)
    }
}
