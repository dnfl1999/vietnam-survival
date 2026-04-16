import SwiftUI

enum PhraseCategory: String, CaseIterable, Codable, Identifiable {
    case hospitalPharmacy
    case taxiGrab
    case airportImmigration
    case hotelAccommodation
    case shopping
    case bankingPayment
    case directions
    case foodOrder
    case priceNegotiation
    case emergency
    case commonPhrases

    var id: String { rawValue }

    var title: String {
        switch self {
        case .hospitalPharmacy: return "병원/약국"
        case .taxiGrab: return "택시/그랩"
        case .airportImmigration: return "공항/입국"
        case .hotelAccommodation: return "호텔/숙소"
        case .shopping: return "쇼핑"
        case .bankingPayment: return "은행/결제"
        case .directions: return "길 묻기"
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
        case .airportImmigration: return "airplane"
        case .hotelAccommodation: return "bed.double.fill"
        case .shopping: return "bag.fill"
        case .bankingPayment: return "creditcard.fill"
        case .directions: return "map.fill"
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
        case .airportImmigration: return .cyan
        case .hotelAccommodation: return .mint
        case .shopping: return .pink
        case .bankingPayment: return .brown
        case .directions: return .purple
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
        case .airportImmigration: return "입국과 공항 이동 표현"
        case .hotelAccommodation: return "체크인과 객실 요청 표현"
        case .shopping: return "옷, 기념품, 생필품 구매 표현"
        case .bankingPayment: return "ATM, 카드, 송금 관련 표현"
        case .directions: return "장소 찾기와 위치 확인 표현"
        case .foodOrder: return "식당과 배달 주문 표현"
        case .priceNegotiation: return "시장과 상점 흥정 표현"
        case .emergency: return "급한 상황에서 바로 사용"
        case .commonPhrases: return "기본 인사와 대화 표현"
        }
    }
}
