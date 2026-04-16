import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }

            FavoritesView()
                .tabItem {
                    Label("즐겨찾기", systemImage: "star.fill")
                }

            PremiumPlaceholderView()
                .tabItem {
                    Label("프리미엄", systemImage: "crown.fill")
                }
        }
    }
}
