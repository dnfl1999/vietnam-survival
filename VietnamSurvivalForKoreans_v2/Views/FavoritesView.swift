import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var store: PhraseStore
    @EnvironmentObject private var favoritesManager: FavoritesManager

    @State private var selectedPhrase: Phrase?

    private var favorites: [Phrase] {
        store.favoritePhrases(using: favoritesManager)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()

                Group {
                    if favorites.isEmpty {
                        ContentUnavailableView(
                            "즐겨찾기가 비어 있습니다",
                            systemImage: "star",
                            description: Text("문장 카드에서 별 버튼을 누르면 여기서 다시 빠르게 볼 수 있습니다.")
                        )
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 14) {
                                ForEach(favorites) { phrase in
                                    PhraseCardView(phrase: phrase) {
                                        selectedPhrase = phrase
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("즐겨찾기")
            .sheet(item: $selectedPhrase) { phrase in
                NavigationStack {
                    PhraseDetailView(phrase: phrase)
                }
                .presentationDetents([.large])
            }
        }
    }
}
