import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';
import 'package:lingua/features/sentence/presentation/bloc/play_audio_event.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_event.dart';

abstract class SentenceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SentenceInitial extends SentenceState {}

class SentenceLoading extends SentenceState {}

class SentenceLoaded extends SentenceState {
  final SentenceData sentence;

  SentenceLoaded(this.sentence);

  @override
  List<Object?> get props => [sentence];
}

class SentenceError extends SentenceState {
  final String message;

  SentenceError(this.message);

  @override
  List<Object?> get props => [message];
}


class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  final TatoebaRepository repository;
  final AudioPlayer audioPlayer = AudioPlayer();

  SentenceBloc({required this.repository}) : super(SentenceInitial()) {
    on<LoadRandomSentence>(_onLoadRandomSentence);
    on<PlayAudio>(_onPlayAudio);
  }

  Future<void> _onLoadRandomSentence(
      LoadRandomSentence event,
      Emitter<SentenceState> emit,
      ) async {
    emit(SentenceLoading());
    try {
      final sentence = await repository.fetchRandomSentence();
      emit(SentenceLoaded(sentence));
    } catch (e) {
      emit(SentenceError(e.toString()));
    }
  }

  Future<void> _onPlayAudio(
      PlayAudio event,
      Emitter<SentenceState> emit,
      ) async {
    try {
      await audioPlayer.play(UrlSource(event.url));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}