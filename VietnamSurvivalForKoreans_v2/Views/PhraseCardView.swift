import SwiftUI

struct PhraseCardView: View {
    let phrase: Phrase
    let onShowLargeText: () -> Void

    @EnvironmentObject private var favoritesManager: FavoritesManager
    @EnvironmentObject private var speechManager: SpeechManager

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                if phrase.isEmergency {
                    Label("긴급", systemImage: "bolt.fill")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.red)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.red.opacity(0.12), in: Capsule())
                }

                Spacer()

                Text(phrase.category.title)
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(phrase.korean)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text(phrase.vietnamese)
                    .font(.title2.bold())

                Text(phrase.vietnamesePlain)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            HStack(alignment: .bottom, spacing: 10) {
                Button {
                    favoritesManager.toggle(phrase)
                } label: {
                    Label("즐겨찾기", systemImage: favoritesManager.isFavorite(phrase) ? "star.fill" : "star")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(.yellow)

                Button {
                    onShowLargeText()
                } label: {
                    Label("크게 보기", systemImage: "textformat.size.larger")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(phrase.category.accentColor)

                Spacer(minLength: 0)

                Button {
                    speechManager.speakVietnamese(phrase.vietnamese)
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.title3.weight(.bold))
                        .foregroundStyle(.white)
                        .frame(width: 50, height: 50)
                        .background(phrase.category.accentColor.gradient, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .buttonStyle(.plain)
                .accessibilityLabel("음성 재생")
            }
        }
        .padding()
        .appCardStyle(tint: phrase.category.accentColor, emphasize: phrase.isEmergency)
    }
}
