import 'package:audioplayers/audioplayers.dart';

class PlayAudio {
  final AudioPlayer audioPlayer;

  PlayAudio(this.audioPlayer);

  Future<void> call(String url) async {
    await audioPlayer.play(UrlSource(url));
  }
}