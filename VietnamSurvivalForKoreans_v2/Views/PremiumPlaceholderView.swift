import SwiftUI

struct PremiumPlaceholderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("프리미엄 기능 Placeholder")
                            .font(.largeTitle.bold())

                        Text("MVP에서는 실제 결제를 붙이지 않고, 향후 유료 기능 구조만 미리 보여줍니다.")
                            .foregroundStyle(.secondary)

                        premiumCard(
                            title: "오프라인 전체 팩",
                            subtitle: "핵심 문장을 한 번에 저장해 더 넓은 범위에서 오프라인으로 사용할 수 있습니다.",
                            icon: "square.and.arrow.down.fill",
                            tint: .blue
                        )

                        premiumCard(
                            title: "AI 상황 추천",
                            subtitle: "현재 상황과 맥락에 맞는 문장을 더 빠르게 제안합니다.",
                            icon: "sparkles",
                            tint: .indigo
                        )

                        premiumCard(
                            title: "응급 문장 빠른팩",
                            subtitle: "응급 상황 문장을 더 빠르게 모아서 확인하는 전용 영역입니다.",
                            icon: "cross.case.fill",
                            tint: .red
                        )

                        premiumCard(
                            title: "광고 제거",
                            subtitle: "광고나 프로모션 영역 없이 더 단순한 화면을 제공합니다.",
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
        .appCardStyle(tint: tint)
    }
}
