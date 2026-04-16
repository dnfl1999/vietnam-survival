import SwiftUI

struct CategoryView: View {
    let category: PhraseCategory

    @EnvironmentObject private var store: PhraseStore
    @State private var selectedPhrase: Phrase?

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: 14) {
                    ForEach(store.phrases(for: category)) { phrase in
                        PhraseCardView(phrase: phrase) {
                            selectedPhrase = phrase
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $selectedPhrase) { phrase in
            NavigationStack {
                PhraseDetailView(phrase: phrase)
            }
            .presentationDetents([.large])
        }
    }
}
