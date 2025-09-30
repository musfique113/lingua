import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';
import 'package:lingua/features/sentence/domain/usecases/get_random_sentence.dart';
import 'package:lingua/features/sentence/domain/usecases/play_audio.dart';

part 'sentence_event.dart';
part 'sentence_state.dart';

class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  final GetRandomSentence getRandomSentence;
  final PlayAudio playAudio;

  SentenceBloc({required this.getRandomSentence, required this.playAudio})
    : super(SentenceInitial()) {
    on<LoadRandomSentence>(_onLoadRandomSentence);
    on<PlayAudioEvent>(_onPlayAudio);
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
    await playAudio(event.url);
  }
}
