import SwiftUI

struct CategoryView: View {
    let category: PhraseCategory

    @EnvironmentObject private var store: PhraseStore
    @State private var selectedPhrase: Phrase?

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 14) {
                // 선택한 카테고리의 문장만 카드 형태로 보여 줍니다.
                ForEach(store.phrases(for: category)) { phrase in
                    PhraseCardView(phrase: phrase) {
                        selectedPhrase = phrase
                    }
                }
            }
            .padding()
        }
        .navigationTitle(category.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
        .sheet(item: $selectedPhrase) { phrase in
            NavigationStack {
                PhraseDetailView(phrase: phrase)
            }
            .presentationDetents([.large])
        }
    }
}
