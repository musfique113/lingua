import 'package:equatable/equatable.dart';
import 'package:lingua/features/sentence/data/models/audio_model.dart';
import 'package:lingua/features/sentence/data/models/translation_model.dart';
import 'package:lingua/features/sentence/domain/entities/translation.dart';
import 'audio.dart';

abstract class Sentence extends Equatable {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final Iterable<TranslationModel> translations;
  final Iterable<AudioModel> audios;
  final String owner;

  const Sentence({
    required this.id,
    required this.text,
    required this.lang,
    this.license,
    required this.translations,
    required this.audios,
    required this.owner,
  });

  @override
  List<Object?> get props => [
    id,
    text,
    lang,
    license,
    translations,
    audios,
    owner,
  ];
}
