import 'package:lingua/features/sentence/data/models/audio_model.dart';
import 'package:lingua/features/sentence/data/models/translation_model.dart';

class SentenceData {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final List<Translation> translations;
  final List<Audio> audios;
  final String owner;

  SentenceData({
    required this.id,
    required this.text,
    required this.lang,
    this.license,
    required this.translations,
    required this.audios,
    required this.owner,
  });

  factory SentenceData.fromJson(Map<String, dynamic> json) {
    return SentenceData(
      id: json['id'],
      text: json['text'],
      lang: json['lang'],
      license: json['license'],
      translations: (json['translations'] as List)
          .map((t) => Translation.fromJson(t))
          .toList(),
      audios: (json['audios'] as List)
          .map((a) => Audio.fromJson(a))
          .toList(),
      owner: json['owner'],
    );
  }
}