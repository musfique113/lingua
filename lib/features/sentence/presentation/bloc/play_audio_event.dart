import 'package:lingua/features/sentence/presentation/bloc/sentence_event.dart';

class PlayAudio extends SentenceEvent {
  final String url;
  PlayAudio(this.url);

  @override
  List<Object?> get props => [url];
}
