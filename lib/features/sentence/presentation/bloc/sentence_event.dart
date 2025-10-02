part of 'sentence_bloc.dart';

abstract class SentenceEvent extends Equatable {
  const SentenceEvent();

  @override
  List<Object> get props => [];
}

class LoadRandomSentence extends SentenceEvent {}

class PlayAudioEvent extends SentenceEvent {
  final String url;

  const PlayAudioEvent(this.url);

  @override
  List<Object> get props => [url];
}

class StopAudioEvent extends SentenceEvent {}

class AudioCompletedEvent extends SentenceEvent {}