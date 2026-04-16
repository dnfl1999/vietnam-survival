import SwiftUI

struct PremiumPlaceholderView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("프리미엄 기능 Placeholder")
                        .font(.largeTitle.bold())

                    Text("MVP에서는 실제 결제를 붙이지 않고, 향후 유료 기능 구조만 미리 보여줍니다.")
                        .foregroundStyle(.secondary)

                    premiumCard(
                        title: "AI 상황 추천",
                        subtitle: "입력 없이 현재 상황에 맞는 문장 세트를 우선 제안",
                        icon: "sparkles",
                        tint: .indigo
                    )

                    premiumCard(
                        title: "오프라인 도시별 팩",
                        subtitle: "하노이, 호치민, 다낭 등 지역 맞춤 문장 팩 제공",
                        icon: "map.fill",
                        tint: .blue
                    )

                    premiumCard(
                        title: "광고 제거",
                        subtitle: "광고 영역 비활성화 및 더 단순한 화면 제공",
                        icon: "nosign",
                        tint: .green
                    )

                    Button {
                    } label: {
                        Text("프리미엄 준비 중")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("프리미엄")
        }
    }

    private func premiumCard(title: String, subtitle: String, icon: String, tint: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
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
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
    }
}
