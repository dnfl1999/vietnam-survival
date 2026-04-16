import SwiftUI

enum PhraseCategory: String, CaseIterable, Codable, Identifiable {
    case hospitalPharmacy
    case taxiGrab
    case foodOrder
    case priceNegotiation
    case emergency
    case commonPhrases

    var id: String { rawValue }

    var title: String {
        switch self {
        case .hospitalPharmacy: return "병원/약국"
        case .taxiGrab: return "택시/그랩"
        case .foodOrder: return "음식 주문"
        case .priceNegotiation: return "가격 흥정"
        case .emergency: return "위험 상황"
        case .commonPhrases: return "자주 쓰는 말"
        }
    }

    var systemImage: String {
        switch self {
        case .hospitalPharmacy: return "cross.case.fill"
        case .taxiGrab: return "car.fill"
        case .foodOrder: return "fork.knife"
        case .priceNegotiation: return "tag.fill"
        case .emergency: return "exclamationmark.triangle.fill"
        case .commonPhrases: return "bubble.left.and.bubble.right.fill"
        }
    }

    var accentColor: Color {
        switch self {
        case .hospitalPharmacy: return .blue
        case .taxiGrab: return .green
        case .foodOrder: return .orange
        case .priceNegotiation: return .teal
        case .emergency: return .red
        case .commonPhrases: return .indigo
        }
    }

    var shortDescription: String {
        switch self {
        case .hospitalPharmacy: return "증상 설명과 진료 도움"
        case .taxiGrab: return "이동 중 자주 쓰는 말"
        case .foodOrder: return "식당과 배달 주문 표현"
        case .priceNegotiation: return "시장과 상점 흥정 표현"
        case .emergency: return "급한 상황에서 바로 사용"
        case .commonPhrases: return "기본 인사와 대화 표현"
        }
    }
}
