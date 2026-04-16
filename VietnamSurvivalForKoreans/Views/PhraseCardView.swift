import SwiftUI

struct PhraseCardView: View {
    let phrase: Phrase
    let onShowLargeText: () -> Void

    @EnvironmentObject private var favoritesManager: FavoritesManager
    @EnvironmentObject private var speechManager: SpeechManager

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            // 카드 안에서 한국어, 베트남어, 즐겨찾기, 액션 버튼을 함께 제공합니다.
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    if phrase.isEmergency {
                        Label("긴급", systemImage: "bolt.fill")
                            .font(.caption.weight(.bold))
                            .foregroundStyle(.red)
                    }

                    Text(phrase.korean)
                        .font(.title3.bold())
                }

                Spacer()

                Button {
                    favoritesManager.toggle(phrase)
                } label: {
                    Image(systemName: favoritesManager.isFavorite(phrase) ? "star.fill" : "star")
                        .foregroundStyle(favoritesManager.isFavorite(phrase) ? .yellow : .secondary)
                        .font(.title3)
                }
                .buttonStyle(.plain)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(phrase.vietnamese)
                    .font(.headline)

                Text(phrase.vietnamesePlain)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            HStack(spacing: 10) {
                Button {
                    onShowLargeText()
                } label: {
                    Label("크게 보기", systemImage: "textformat.size.larger")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(phrase.category.accentColor)

                Button {
                    speechManager.speakVietnamese(phrase.vietnamese)
                } label: {
                    Label("음성 재생", systemImage: "speaker.wave.2.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(phrase.isEmergency ? Color.red.opacity(0.35) : Color.clear, lineWidth: 1.5)
        )
    }
}
