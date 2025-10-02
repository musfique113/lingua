import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/usecases/get_random_sentence.dart';
import 'package:lingua/features/sentence/domain/usecases/play_audio.dart';

part 'sentence_event.dart';
part 'sentence_state.dart';

class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  final GetRandomSentence getRandomSentence;
  final PlayAudio playAudio;
  String? _currentlyPlayingUrl;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  SentenceBloc({required this.getRandomSentence, required this.playAudio})
    : super(SentenceInitial()) {
    on<LoadRandomSentence>(_onLoadRandomSentence);
    on<PlayAudioEvent>(_onPlayAudio);
    on<StopAudioEvent>(_onStopAudio);
    on<AudioCompletedEvent>(_onAudioCompleted);

    _playerStateSubscription = playAudio.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed || state == PlayerState.stopped) {
        add(AudioCompletedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _playerStateSubscription?.cancel();
    playAudio.dispose();
    return super.close();
  }

  Future<void> _onLoadRandomSentence(
    LoadRandomSentence event,
    Emitter<SentenceState> emit,
  ) async {
    emit(SentenceLoading());
    try {
      final sentence = await getRandomSentence();
      emit(SentenceLoaded(sentence));
    } catch (e) {
      emit(SentenceError(e.toString()));
    }
  }

  Future<void> _onPlayAudio(
    PlayAudioEvent event,
    Emitter<SentenceState> emit,
  ) async {
    final currentState = state;
    if (currentState is SentenceLoaded || currentState is AudioPlaying) {
      final sentence = currentState is SentenceLoaded
          ? currentState.sentence
          : (currentState as AudioPlaying).sentence;

      _currentlyPlayingUrl = event.url;
      emit(AudioLoading(event.url, sentence));

      try {
        await playAudio(event.url);
        if (_currentlyPlayingUrl == event.url) {
          emit(AudioPlaying(event.url, sentence));
        }
      } catch (e) {
        emit(SentenceLoaded(sentence));
      }
    }
  }

  Future<void> _onStopAudio(
    StopAudioEvent event,
    Emitter<SentenceState> emit,
  ) async {
    final currentState = state;
    if (currentState is AudioPlaying || currentState is AudioLoading) {
      _currentlyPlayingUrl = null;
      await playAudio.stop();

      final sentence = currentState is AudioPlaying
          ? currentState.sentence
          : (currentState as AudioLoading).sentence;

      emit(SentenceLoaded(sentence));
    }
  }

  Future<void> _onAudioCompleted(
    AudioCompletedEvent event,
    Emitter<SentenceState> emit,
  ) async {
    final currentState = state;
    if (currentState is AudioPlaying) {
      _currentlyPlayingUrl = null;
      emit(SentenceLoaded(currentState.sentence));
    }
  }
}