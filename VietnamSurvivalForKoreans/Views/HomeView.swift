import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var store: PhraseStore

    @State private var showUpdateSheet = false
    @State private var showRefreshAlert = false

    private let featuredCategories: [PhraseCategory] = [
        .policeLostItem,
        .simInternet,
        .restroomLaundry,
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 상단에서 앱의 목적을 먼저 설명해
                    // 처음 보는 사용자도 바로 이해할 수 있게 합니다.
                    headerSection
                    updateControlSection
                    featuredCategorySection
                    categoryGrid
                    quickInfoSection
                    futureSection
                }
                .padding()
            }
            .navigationTitle("Vietnam Survival")
            .navigationBarTitleDisplayMode(.large)
            .alert("새 콘텐츠를 다시 불러왔어요", isPresented: $showRefreshAlert) {
                Button("확인", role: .cancel) { }
            } message: {
                Text("현재 \(store.categoryCount)개 카테고리와 \(store.phraseCount)개 문장을 앱에 반영했습니다.")
            }
            .sheet(isPresented: $showUpdateSheet) {
                UpdateSummaryView()
                    .environmentObject(store)
            }
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

    private var updateControlSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("콘텐츠 업데이트")
                        .font(.title3.bold())

                    Text("현재 \(store.categoryCount)개 카테고리, \(store.phraseCount)개 문장")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("최신")
                    .font(.caption.bold())
                    .foregroundStyle(.green)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(Color.green.opacity(0.14))
                    )
            }

            HStack(spacing: 12) {
                actionButton(title: "새로고침", systemImage: "arrow.clockwise", tint: .blue) {
                    store.reloadSamplePhrases()
                    showRefreshAlert = true
                }

                actionButton(title: "업데이트", systemImage: "square.and.arrow.down.fill", tint: .teal) {
                    showUpdateSheet = true
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
    }

    private func actionButton(title: String, systemImage: String, tint: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemImage)
                .font(.subheadline.bold())
                .foregroundStyle(tint)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(tint.opacity(0.12))
                )
        }
        .buttonStyle(.plain)
    }

    private var categoryGrid: some View {
        let regularCategories = PhraseCategory.allCases.filter { !featuredCategories.contains($0) }

        return VStack(alignment: .leading, spacing: 12) {
            Text("전체 카테고리")
                .font(.title3.bold())

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                ForEach(regularCategories) { category in
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

    private var featuredCategorySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("새로 추가된 카테고리")
                    .font(.title3.bold())

                Spacer()

                Text("추천")
                    .font(.caption.bold())
                    .foregroundStyle(.blue)
                    .padding(.horizontal, 9)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.blue.opacity(0.12))
                    )
            }

            Text("분실 신고, 통신 문제, 세탁 같은 자주 막히는 상황을 먼저 꺼내 둘 수 있게 위쪽으로 올렸습니다.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                ForEach(featuredCategories) { category in
                    NavigationLink {
                        CategoryView(category: category)
                    } label: {
                        CategoryButton(category: category, isFeatured: true)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
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

private struct UpdateSummaryView: View {
    @EnvironmentObject private var store: PhraseStore
    @Environment(\.dismiss) private var dismiss

    private let newestCategories = ["공항/입국", "호텔/숙소", "쇼핑", "은행/결제", "길 묻기"]

    var body: some View {
        NavigationStack {
            List {
                Section("현재 앱 데이터") {
                    Label("\(store.categoryCount)개 카테고리", systemImage: "square.grid.2x2.fill")
                    Label("\(store.phraseCount)개 문장", systemImage: "text.bubble.fill")
                }

                Section("최근 추가된 카테고리") {
                    ForEach(newestCategories, id: \.self) { category in
                        Text(category)
                    }
                }

                Section("안내") {
                    Text("업데이트 버튼은 이번에 확장된 문장과 카테고리 현황을 바로 확인할 수 있게 해줍니다.")
                    Text("새로고침 버튼을 누르면 현재 앱에 들어 있는 문장을 다시 불러옵니다.")
                }
            }
            .navigationTitle("업데이트")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("닫기") {
                        dismiss()
                    }
                }
            }
        }
    }
}
