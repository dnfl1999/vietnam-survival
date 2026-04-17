import SwiftUI

struct CategoryButton: View {
    let category: PhraseCategory
    var isFeatured: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image(systemName: category.systemImage)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 56, height: 56)
                    .background(category.accentColor.gradient, in: RoundedRectangle(cornerRadius: 18, style: .continuous))

                Spacer()

                if isFeatured {
                    Text("NEW")
                        .font(.caption2.bold())
                        .foregroundStyle(category.accentColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(category.accentColor.opacity(0.14))
                        )
                }
            }

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
                .stroke(
                    category == .emergency ? Color.red.opacity(0.35) : (isFeatured ? category.accentColor.opacity(0.35) : Color.clear),
                    lineWidth: 1.5
                )
        )
    }
}
