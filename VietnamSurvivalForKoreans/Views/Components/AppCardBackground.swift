import SwiftUI

// 반복되는 카드 배경 스타일을 한 곳에서 관리합니다.
// 화면 전반의 통일감과 유지보수성을 높이기 위한 공통 컴포넌트입니다.
struct AppCardBackground: ViewModifier {
    let tint: Color?
    let emphasize: Bool

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(Color(.secondarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(borderColor, lineWidth: emphasize ? 1.6 : 0.9)
            )
            .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 4)
    }

    private var borderColor: Color {
        if let tint {
            return tint.opacity(emphasize ? 0.35 : 0.14)
        }

        return Color.primary.opacity(0.06)
    }
}

extension View {
    func appCardStyle(tint: Color? = nil, emphasize: Bool = false) -> some View {
        modifier(AppCardBackground(tint: tint, emphasize: emphasize))
    }
}
