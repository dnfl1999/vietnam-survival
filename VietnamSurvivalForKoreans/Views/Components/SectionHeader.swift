import SwiftUI

// 섹션 제목과 보조 설명을 같은 스타일로 보여주기 위한 컴포넌트입니다.
struct SectionHeader: View {
    let title: String
    let subtitle: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.title3.bold())

            if let subtitle, subtitle.isEmpty == false {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
