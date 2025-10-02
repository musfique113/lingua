import 'package:audioplayers/audioplayers.dart';

class PlayAudio {
  final AudioPlayer _audioPlayer;

  PlayAudio(this._audioPlayer) {
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  Future<void> call(String url) async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
    } catch (e) {
      throw Exception('Failed to play audio: $e');
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.onPlayerStateChanged;

  void dispose() {
    _audioPlayer.dispose();
  }
}
