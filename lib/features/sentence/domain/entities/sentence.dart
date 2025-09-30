import 'package:equatable/equatable.dart';
import 'package:lingua/features/sentence/domain/entities/audio.dart';
import 'package:lingua/features/sentence/domain/entities/translation.dart';

class Sentence extends Equatable {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final List<Translation> translations;
  final List<Audio> audios;
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
