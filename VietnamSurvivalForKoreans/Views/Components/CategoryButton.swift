import SwiftUI

struct CategoryButton: View {
    let category: PhraseCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: category.systemImage)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(category.accentColor.gradient, in: RoundedRectangle(cornerRadius: 18, style: .continuous))

            Text(category.title)
                .font(.title3.bold())

            Text(category.shortDescription)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 170, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(category == .emergency ? Color.red.opacity(0.35) : Color.clear, lineWidth: 1.5)
        )
    }
}
