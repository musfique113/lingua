part of 'sentence_bloc.dart';

abstract class SentenceState extends Equatable {
  const SentenceState();

  @override
  List<Object> get props => [];
}

class SentenceInitial extends SentenceState {}

class SentenceLoading extends SentenceState {}

class SentenceLoaded extends SentenceState {
  final SentenceModel sentence;

  const SentenceLoaded(this.sentence);

  @override
  List<Object> get props => [sentence];
}

class AudioLoading extends SentenceState {
  final String url;
  final SentenceModel sentence;

  const AudioLoading(this.url, this.sentence);

  @override
  List<Object> get props => [url, sentence];
}

class AudioPlaying extends SentenceState {
  final String url;
  final SentenceModel sentence;

  const AudioPlaying(this.url, this.sentence);

  @override
  List<Object> get props => [url, sentence];
}

class SentenceError extends SentenceState {
  final String message;

  const SentenceError(this.message);

  @override
  List<Object> get props => [message];
}