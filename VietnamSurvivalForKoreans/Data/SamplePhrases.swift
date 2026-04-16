import Foundation

enum SamplePhrases {
    static let all: [Phrase] = [
        Phrase(id: "hospital_1", category: .hospitalPharmacy, korean: "열이 있어요", vietnamese: "Toi bi sot.", vietnamesePlain: "Toi bi sot.", isEmergency: false),
        Phrase(id: "hospital_2", category: .hospitalPharmacy, korean: "설사하고 있어요", vietnamese: "Toi dang bi tieu chay.", vietnamesePlain: "Toi dang bi tieu chay.", isEmergency: false),
        Phrase(id: "hospital_3", category: .hospitalPharmacy, korean: "배가 아파요", vietnamese: "Toi bi dau bung.", vietnamesePlain: "Toi bi dau bung.", isEmergency: false),
        Phrase(id: "hospital_4", category: .hospitalPharmacy, korean: "두통이 있어요", vietnamese: "Toi bi dau dau.", vietnamesePlain: "Toi bi dau dau.", isEmergency: false),
        Phrase(id: "hospital_5", category: .hospitalPharmacy, korean: "약 주세요", vietnamese: "Lam on cho toi thuoc.", vietnamesePlain: "Lam on cho toi thuoc.", isEmergency: false),
        Phrase(id: "hospital_6", category: .hospitalPharmacy, korean: "보험 되나요?", vietnamese: "Bao hiem co ap dung khong?", vietnamesePlain: "Bao hiem co ap dung khong?", isEmergency: false),
        Phrase(id: "hospital_7", category: .hospitalPharmacy, korean: "빨리 진료받고 싶어요", vietnamese: "Toi muon duoc kham nhanh.", vietnamesePlain: "Toi muon duoc kham nhanh.", isEmergency: false),

        Phrase(id: "taxi_1", category: .taxiGrab, korean: "여기로 가주세요", vietnamese: "Lam on dua toi den day.", vietnamesePlain: "Lam on dua toi den day.", isEmergency: false),
        Phrase(id: "taxi_2", category: .taxiGrab, korean: "여기서 세워주세요", vietnamese: "Lam on dung o day.", vietnamesePlain: "Lam on dung o day.", isEmergency: false),
        Phrase(id: "taxi_3", category: .taxiGrab, korean: "빨리 가주세요", vietnamese: "Lam on di nhanh giup toi.", vietnamesePlain: "Lam on di nhanh giup toi.", isEmergency: false),
        Phrase(id: "taxi_4", category: .taxiGrab, korean: "천천히 가주세요", vietnamese: "Lam on di cham thoi.", vietnamesePlain: "Lam on di cham thoi.", isEmergency: false),
        Phrase(id: "taxi_5", category: .taxiGrab, korean: "다른 길로 가주세요", vietnamese: "Lam on di duong khac.", vietnamesePlain: "Lam on di duong khac.", isEmergency: false),
        Phrase(id: "taxi_6", category: .taxiGrab, korean: "여기 맞나요?", vietnamese: "Day co dung khong?", vietnamesePlain: "Day co dung khong?", isEmergency: false),
        Phrase(id: "taxi_7", category: .taxiGrab, korean: "요금이 얼마예요?", vietnamese: "Gia bao nhieu?", vietnamesePlain: "Gia bao nhieu?", isEmergency: false),

        Phrase(id: "food_1", category: .foodOrder, korean: "고수 빼주세요", vietnamese: "Lam on dung cho rau mui.", vietnamesePlain: "Lam on dung cho rau mui.", isEmergency: false),
        Phrase(id: "food_2", category: .foodOrder, korean: "맵지 않게 해주세요", vietnamese: "Lam on dung lam cay.", vietnamesePlain: "Lam on dung lam cay.", isEmergency: false),
        Phrase(id: "food_3", category: .foodOrder, korean: "돼지고기 말고요", vietnamese: "Toi khong an thit heo.", vietnamesePlain: "Toi khong an thit heo.", isEmergency: false),
        Phrase(id: "food_4", category: .foodOrder, korean: "포장해 주세요", vietnamese: "Lam on dong go mang di.", vietnamesePlain: "Lam on dong go mang di.", isEmergency: false),
        Phrase(id: "food_5", category: .foodOrder, korean: "물 주세요", vietnamese: "Lam on cho toi nuoc.", vietnamesePlain: "Lam on cho toi nuoc.", isEmergency: false),
        Phrase(id: "food_6", category: .foodOrder, korean: "얼음 빼주세요", vietnamese: "Lam on dung cho da.", vietnamesePlain: "Lam on dung cho da.", isEmergency: false),
        Phrase(id: "food_7", category: .foodOrder, korean: "계산해 주세요", vietnamese: "Lam on tinh tien.", vietnamesePlain: "Lam on tinh tien.", isEmergency: false),

        Phrase(id: "price_1", category: .priceNegotiation, korean: "너무 비싸요", vietnamese: "Dat qua.", vietnamesePlain: "Dat qua.", isEmergency: false),
        Phrase(id: "price_2", category: .priceNegotiation, korean: "좀 깎아주세요", vietnamese: "Lam on giam gia mot chut.", vietnamesePlain: "Lam on giam gia mot chut.", isEmergency: false),
        Phrase(id: "price_3", category: .priceNegotiation, korean: "다른 데는 더 싸요", vietnamese: "Noi khac re hon.", vietnamesePlain: "Noi khac re hon.", isEmergency: false),
        Phrase(id: "price_4", category: .priceNegotiation, korean: "현금으로 할게요", vietnamese: "Toi se tra bang tien mat.", vietnamesePlain: "Toi se tra bang tien mat.", isEmergency: false),
        Phrase(id: "price_5", category: .priceNegotiation, korean: "마지막 가격 얼마예요?", vietnamese: "Gia cuoi cung la bao nhieu?", vietnamesePlain: "Gia cuoi cung la bao nhieu?", isEmergency: false),
        Phrase(id: "price_6", category: .priceNegotiation, korean: "그냥 볼게요", vietnamese: "Toi chi xem thoi.", vietnamesePlain: "Toi chi xem thoi.", isEmergency: false),
        Phrase(id: "price_7", category: .priceNegotiation, korean: "생각해볼게요", vietnamese: "Toi se suy nghi them.", vietnamesePlain: "Toi se suy nghi them.", isEmergency: false),

        Phrase(id: "emergency_1", category: .emergency, korean: "도와주세요", vietnamese: "Lam on cuu toi.", vietnamesePlain: "Lam on cuu toi.", isEmergency: true),
        Phrase(id: "emergency_2", category: .emergency, korean: "경찰 불러주세요", vietnamese: "Lam on goi canh sat.", vietnamesePlain: "Lam on goi canh sat.", isEmergency: true),
        Phrase(id: "emergency_3", category: .emergency, korean: "병원 가야 해요", vietnamese: "Toi can den benh vien ngay.", vietnamesePlain: "Toi can den benh vien ngay.", isEmergency: true),
        Phrase(id: "emergency_4", category: .emergency, korean: "사고가 났어요", vietnamese: "Da co tai nan.", vietnamesePlain: "Da co tai nan.", isEmergency: true),
        Phrase(id: "emergency_5", category: .emergency, korean: "지갑을 잃어버렸어요", vietnamese: "Toi bi mat vi.", vietnamesePlain: "Toi bi mat vi.", isEmergency: true),
        Phrase(id: "emergency_6", category: .emergency, korean: "휴대폰을 잃어버렸어요", vietnamese: "Toi bi mat dien thoai.", vietnamesePlain: "Toi bi mat dien thoai.", isEmergency: true),
        Phrase(id: "emergency_7", category: .emergency, korean: "지금 녹음하고 있어요", vietnamese: "Toi dang ghi am bay gio.", vietnamesePlain: "Toi dang ghi am bay gio.", isEmergency: true),

        Phrase(id: "common_1", category: .commonPhrases, korean: "안녕하세요", vietnamese: "Xin chao.", vietnamesePlain: "Xin chao.", isEmergency: false),
        Phrase(id: "common_2", category: .commonPhrases, korean: "감사합니다", vietnamese: "Cam on.", vietnamesePlain: "Cam on.", isEmergency: false),
        Phrase(id: "common_3", category: .commonPhrases, korean: "괜찮아요", vietnamese: "Khong sao dau.", vietnamesePlain: "Khong sao dau.", isEmergency: false),
        Phrase(id: "common_4", category: .commonPhrases, korean: "이해했어요", vietnamese: "Toi hieu roi.", vietnamesePlain: "Toi hieu roi.", isEmergency: false),
        Phrase(id: "common_5", category: .commonPhrases, korean: "이해 못 했어요", vietnamese: "Toi chua hieu.", vietnamesePlain: "Toi chua hieu.", isEmergency: false),
        Phrase(id: "common_6", category: .commonPhrases, korean: "다시 말해 주세요", vietnamese: "Lam on noi lai.", vietnamesePlain: "Lam on noi lai.", isEmergency: false),
        Phrase(id: "common_7", category: .commonPhrases, korean: "천천히 말해 주세요", vietnamese: "Lam on noi cham thoi.", vietnamesePlain: "Lam on noi cham thoi.", isEmergency: false)
    ]
}
