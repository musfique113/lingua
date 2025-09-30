import 'package:lingua/features/sentence/data/models/transcription_model.dart';
import 'package:lingua/features/sentence/domain/entities/translation.dart';

import 'audio_model.dart';

class TranslationModel extends Translation {
  const TranslationModel({
    required super.id,
    required super.text,
    required super.lang,
    super.license,
    required super.isDirect,
    required List<AudioModel> super.audios,
    required List<TranscriptionModel> super.transcriptions,
    required super.owner,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      lang: json['lang'] ?? '',
      license: json['license'] ?? '',
      isDirect: json['is_direct'] ?? false,
      audios:
          (json['audios'] as List?)
              ?.map((a) => AudioModel.fromJson(a))
              .toList() ??
          [],
      transcriptions:
          (json['transcriptions'] as List?)
              ?.map((t) => TranscriptionModel.fromJson(t))
              .toList() ??
          [],
      owner: json['owner'] ?? '',
    );
  }
}