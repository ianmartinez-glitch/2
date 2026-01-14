import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceControl {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool isAvailable = false;
  bool isListening = false;

  Future<void> initSpeech() async {
    isAvailable = await _speech.initialize();
  }

  void startListening(Function(String) onResult) {
    if (!isAvailable) return;
    _speech.listen(
      localeId: 'ca_ES',
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
    isListening = true;
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
  }
}
