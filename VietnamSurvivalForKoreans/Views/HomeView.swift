import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 상단에서 앱의 목적을 먼저 설명해
                    // 처음 보는 사용자도 바로 이해할 수 있게 합니다.
                    headerSection
                    categoryGrid
                    quickInfoSection
                    futureSection
                }
                .padding()
            }
            .navigationTitle("Vietnam Survival")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
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
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.thinMaterial)
        )
    }

    private var categoryGrid: some View {
        // 핵심 카테고리 6개를 큰 버튼으로 보여 줍니다.
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

    private var quickInfoSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("빠른 안내")
                .font(.title3.bold())

            VStack(spacing: 12) {
                placeholderCard(
                    title: "응급 문장 바로가기",
                    subtitle: "위험 상황 카테고리는 눈에 띄는 빨간색으로 강조했습니다.",
                    systemImage: "exclamationmark.shield.fill",
                    tint: .red
                )

                placeholderCard(
                    title: "광고 영역 Placeholder",
                    subtitle: "향후 배너 광고나 공지 노출 위치로 사용할 수 있습니다.",
                    systemImage: "rectangle.center.inset.filled.badge.plus",
                    tint: .gray
                )
            }
        }
    }

    private var futureSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("향후 확장 자리")
                .font(.title3.bold())

            VStack(spacing: 12) {
                placeholderCard(
                    title: "AI 상황 추천",
                    subtitle: "사용 상황에 맞는 문장 묶음을 추천하는 기능 자리입니다.",
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
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
