import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        headerSection
                        categorySection
                        quickEntrySection
                        quickInfoSection
                        futureSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Vietnam Survival")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("당황할 때 바로 누르는 베트남 생존 문장")
                .font(.headline)
                .foregroundStyle(.secondary)

            Text("당황하기 전에\n바로 눌러서 보여주세요")
                .font(.system(size: 30, weight: .bold))

            Text("복잡한 입력 없이 상황별 문장을 빠르게 열고, 베트남어로 크게 보여주거나 음성으로 재생할 수 있습니다.")
                .font(.body)
                .foregroundStyle(.secondary)

            HStack(spacing: 10) {
                Label("오프라인 사용 가능", systemImage: "wifi.slash")
                Label("TTS 지원", systemImage: "speaker.wave.2.fill")
            }
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            LinearGradient(
                colors: [Color.blue.opacity(0.18), Color.teal.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.white.opacity(0.25), lineWidth: 1)
        )
    }

    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(
                title: "상황 카테고리",
                subtitle: "필요한 상황을 누르면 바로 쓸 수 있는 문장이 열립니다."
            )

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                ForEach(PhraseCategory.allCases) { category in
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        CategoryButton(category: category)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var quickEntrySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(
                title: "빠른 진입",
                subtitle: "즐겨찾기, 전체 검색, 프리미엄으로 빠르게 이동합니다."
            )

            HStack(spacing: 12) {
                quickEntryLink(title: "즐겨찾기", systemImage: "star.fill", tint: .yellow) {
                    FavoritesView()
                }

                quickEntryLink(title: "전체 검색", systemImage: "magnifyingglass", tint: .blue) {
                    SearchView()
                }

                quickEntryLink(title: "프리미엄", systemImage: "crown.fill", tint: .orange) {
                    PremiumPlaceholderView()
                }
            }
        }
    }

    private var quickInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(
                title: "빠른 안내",
                subtitle: "위험 상황은 홈과 목록에서 더 강하게 강조했습니다."
            )

            VStack(spacing: 12) {
                placeholderCard(
                    title: "응급 문장 바로가기",
                    subtitle: "위험 상황 카테고리는 빨간 강조선으로 더 눈에 띄게 표시됩니다.",
                    systemImage: "exclamationmark.shield.fill",
                    tint: .red
                )

                placeholderCard(
                    title: "광고 영역 Placeholder",
                    subtitle: "향후 배너 광고나 공지 노출 영역으로 확장할 수 있습니다.",
                    systemImage: "rectangle.center.inset.filled.badge.plus",
                    tint: .gray
                )
            }
        }
    }

    private var futureSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            SectionHeader(
                title: "향후 확장 자리",
                subtitle: "MVP 이후 붙일 기능 구조를 미리 잡아 두었습니다."
            )

            VStack(spacing: 12) {
                placeholderCard(
                    title: "AI 상황 추천",
                    subtitle: "현재 맥락에 맞는 문장을 추천하는 확장 기능 자리입니다.",
                    systemImage: "sparkles.rectangle.stack.fill",
                    tint: .indigo
                )

                placeholderCard(
                    title: "오프라인 팩",
                    subtitle: "도시별, 상황별 문장 팩 다운로드 구조를 붙일 수 있습니다.",
                    systemImage: "square.and.arrow.down.fill",
                    tint: .blue
                )
            }
        }
    }

    private func quickEntryLink<Destination: View>(title: String, systemImage: String, tint: Color, @ViewBuilder destination: () -> Destination) -> some View {
        NavigationLink {
            destination()
        } label: {
            VStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.title2.weight(.bold))
                    .foregroundStyle(.white)
                    .frame(width: 48, height: 48)
                    .background(tint.gradient, in: RoundedRectangle(cornerRadius: 16, style: .continuous))

                Text(title)
                    .font(.subheadline.bold())
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 10)
            .appCardStyle()
        }
        .buttonStyle(.plain)
    }

    private func placeholderCard(title: String, subtitle: String, systemImage: String, tint: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: systemImage)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 46, height: 46)
                .background(tint.gradient, in: RoundedRectangle(cornerRadius: 14, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .appCardStyle(tint: tint)
    }
}
