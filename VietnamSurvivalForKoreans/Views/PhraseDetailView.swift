import SwiftUI
import UIKit

struct PhraseDetailView: View {
    let phrase: Phrase

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var favoritesManager: FavoritesManager
    @EnvironmentObject private var speechManager: SpeechManager

    @State private var showCopiedMessage = false
    @State private var showPresentMode = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headerCard
                contentCard
                actionButtons
            }
            .padding()
        }
        .navigationTitle("문장 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("닫기") {
                    dismiss()
                }
            }
        }
        .alert("복사 완료", isPresented: $showCopiedMessage) {
            Button("확인", role: .cancel) { }
        } message: {
            Text("베트남어 문장을 클립보드에 복사했습니다.")
        }
        .fullScreenCover(isPresented: $showPresentMode) {
            DisplayModeView(phrase: phrase)
        }
    }

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label(phrase.category.title, systemImage: phrase.category.systemImage)
                    .font(.headline)
                    .foregroundStyle(phrase.category.accentColor)

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

            Text(phrase.korean)
                .font(.largeTitle.bold())
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
    }

    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            detailRow(title: "한국어", value: phrase.korean)
            detailRow(title: "베트남어", value: phrase.vietnamese)
            detailRow(title: "성조 없는 베트남어", value: phrase.vietnamesePlain)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button {
                showPresentMode = true
            } label: {
                Label("직접 보여주기", systemImage: "rectangle.inset.filled.and.person.filled")
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

            Button {
                UIPasteboard.general.string = phrase.vietnamese
                showCopiedMessage = true
            } label: {
                Label("복사", systemImage: "doc.on.doc")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
        }
    }

    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.secondary)

            Text(value)
                .font(.title3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct DisplayModeView: View {
    let phrase: Phrase

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var speechManager: SpeechManager

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Text(phrase.vietnamese)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text(phrase.vietnamesePlain)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Text(phrase.korean)
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                HStack(spacing: 12) {
                    Button {
                        speechManager.speakVietnamese(phrase.vietnamese)
                    } label: {
                        Label("음성 재생", systemImage: "speaker.wave.2.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)

                    Button {
                        dismiss()
                    } label: {
                        Label("닫기", systemImage: "xmark")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.white)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
    }
}
