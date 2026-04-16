import Foundation

final class PhraseStore: ObservableObject {
    @Published private(set) var phrases: [Phrase]

    init(phrases: [Phrase] = SamplePhrases.all) {
        self.phrases = phrases
    }

    func phrases(for category: PhraseCategory) -> [Phrase] {
        phrases.filter { $0.category == category }
    }

    func favoritePhrases(using favoritesManager: FavoritesManager) -> [Phrase] {
        phrases
            .filter { favoritesManager.favoriteIDs.contains($0.id) }
            .sorted { $0.korean < $1.korean }
    }

    func searchPhrases(query: String) -> [Phrase] {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)

        guard trimmedQuery.isEmpty == false else {
            return phrases.sorted { $0.korean < $1.korean }
        }

        let lowercasedQuery = trimmedQuery.lowercased()

        return phrases
            .filter { phrase in
                phrase.korean.lowercased().contains(lowercasedQuery)
                || phrase.vietnamese.lowercased().contains(lowercasedQuery)
                || phrase.vietnamesePlain.lowercased().contains(lowercasedQuery)
            }
            .sorted { left, right in
                let leftStartsWithKorean = left.korean.lowercased().hasPrefix(lowercasedQuery)
                let rightStartsWithKorean = right.korean.lowercased().hasPrefix(lowercasedQuery)

                if leftStartsWithKorean != rightStartsWithKorean {
                    return leftStartsWithKorean
                }

                return left.korean < right.korean
            }
    }
}
