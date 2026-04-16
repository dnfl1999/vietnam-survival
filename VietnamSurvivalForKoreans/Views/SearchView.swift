import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var store: PhraseStore
    @State private var query = ""
    @State private var selectedPhrase: Phrase?

    // 한국어 우선 검색 로직은 PhraseStore에서 처리하고
    // 이 화면은 결과 표시 역할에 집중합니다.
    private var results: [Phrase] {
        store.searchPhrases(query: query)
    }

    var body: some View {
        NavigationStack {
            Group {
                if results.isEmpty {
                    ContentUnavailableView(
                        "검색 결과가 없습니다",
                        systemImage: "magnifyingglass",
                        description: Text("한국어로 먼저 검색하고, 필요하면 베트남어로도 검색해 보세요.")
                    )
                } else {
                    ScrollView {
                        LazyVStack(spacing: 14) {
                            ForEach(results) { phrase in
                                PhraseCardView(phrase: phrase) {
                                    selectedPhrase = phrase
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("전체 검색")
            .searchable(text: $query, prompt: "한국어 또는 베트남어 검색")
            .sheet(item: $selectedPhrase) { phrase in
                NavigationStack {
                    PhraseDetailView(phrase: phrase)
                }
                .presentationDetents([.large])
            }
        }
    }
}
