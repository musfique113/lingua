import 'package:lingua/features/sentence/data/models/audio_model.dart';
import 'package:lingua/features/sentence/data/models/translation_model.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';

class SentenceModel {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final List<TranslationModel> translations;
  final List<AudioModel> audios;
  final String owner;

  const SentenceModel({
    required this.id,
    required this.text,
    required this.lang,
    this.license,
    required this.translations,
    required this.audios,
    required this.owner,
  });

  factory SentenceModel.fromJson(Map<String, dynamic> json) {
    final translationsList = json['translations'] as List<dynamic>? ?? [];
    final audiosList = json['audios'] as List<dynamic>? ?? [];

    return SentenceModel(
      id: json['id'] as int? ?? 0,
      text: json['text'] as String? ?? '',
      lang: json['lang'] as String? ?? '',
      license: json['license'] as String?,
      translations: translationsList
          .map((t) => TranslationModel.fromJson(t as Map<String, dynamic>))
          .toList(),
      audios: audiosList
          .map((a) => AudioModel.fromJson(a as Map<String, dynamic>))
          .toList(),
      owner: json['user']?['username'] as String? ?? 'unknown',
    );
  }

  Sentence toEntity() {
    return Sentence(
      id: id,
      text: text,
      lang: lang,
      license: license,
      translations: translations.map((model) => model.toEntity()).toList(),
      audios: audios.map((model) => model.toEntity()).toList(),
      owner: owner,
    );
  }
}
