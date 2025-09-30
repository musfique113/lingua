import 'package:lingua/features/sentence/data/models/audio_model.dart';
import 'package:lingua/features/sentence/data/models/translation_model.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';

class SentenceModel extends Sentence {
  const SentenceModel({
    required super.id,
    required super.text,
    required super.lang,
    super.license,
    required List<TranslationModel> super.translations,
    required List<AudioModel> super.audios,
    required super.owner,
  });

  factory SentenceModel.fromJson(Map<String, dynamic> json) {
    return SentenceModel(
      id: json['id'],
      text: json['text'],
      lang: json['lang'],
      license: json['license'],
      translations: (json['translations'] as List)
          .map((t) => TranslationModel.fromJson(t))
          .toList(),
      audios: (json['audios'] as List)
          .map((a) => AudioModel.fromJson(a))
          .toList(),
      owner: json['owner'],
    );
  }
}
