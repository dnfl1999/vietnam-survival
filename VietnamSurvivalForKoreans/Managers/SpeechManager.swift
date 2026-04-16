import AVFoundation
import Foundation

final class SpeechManager: NSObject, ObservableObject {
    private let synthesizer = AVSpeechSynthesizer()

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
