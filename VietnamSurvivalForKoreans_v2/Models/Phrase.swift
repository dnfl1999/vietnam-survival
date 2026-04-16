import Foundation

struct Phrase: Identifiable, Codable, Hashable {
    let id: String
    let category: PhraseCategory
    let korean: String
    let vietnamese: String
    let vietnamesePlain: String
    let isEmergency: Bool
}
