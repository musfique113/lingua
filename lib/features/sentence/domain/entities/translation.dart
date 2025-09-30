import 'package:equatable/equatable.dart';
import 'package:lingua/features/sentence/data/models/audio_model.dart';
import 'package:lingua/features/sentence/data/models/transcription_model.dart';


abstract class Translation extends Equatable {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final bool isDirect;
  final List<AudioModel> audios;
  final List<TranscriptionModel> transcriptions;
  final String owner;

  const Translation({
    required this.id,
    required this.text,
    required this.lang,
    this.license,
    required this.isDirect,
    required this.audios,
    required this.transcriptions,
    required this.owner,
  });

  @override
  List<Object?> get props => [
    id,
    text,
    lang,
    license,
    isDirect,
    audios,
    transcriptions,
    owner,
  ];
}
