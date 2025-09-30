import 'package:equatable/equatable.dart';
import 'package:lingua/features/sentence/domain/entities/audio.dart';
import 'package:lingua/features/sentence/domain/entities/transcription.dart';

class Translation extends Equatable {
  final int id;
  final String text;
  final String lang;
  final String license;
  final bool isDirect;
  final List<Audio> audios;
  final List<Transcription> transcriptions;
  final String owner;

  const Translation({
    required this.id,
    required this.text,
    required this.lang,
    required this.license,
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
