import SwiftUI

struct RootTabView: View {
    var body: some View {
        // MVP에서는 탭 구조를 단순하게 유지해
        // 홈, 검색, 즐겨찾기, 프리미엄 Placeholder만 제공합니다.
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
