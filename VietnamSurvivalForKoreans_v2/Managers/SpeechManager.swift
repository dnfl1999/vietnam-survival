import AVFoundation
import Foundation

final class SpeechManager: NSObject, ObservableObject {
    private let synthesizer = AVSpeechSynthesizer()

    // iOS 기본 TTS를 사용해 베트남어 문장을 읽습니다.
    func speakVietnamese(_ text: String) {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "vi-VN")
        utterance.rate = 0.47
        utterance.pitchMultiplier = 1.0
        utterance.volume = 1.0

        synthesizer.speak(utterance)
    }
}
