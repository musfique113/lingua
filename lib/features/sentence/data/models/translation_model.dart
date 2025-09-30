import 'package:lingua/features/sentence/data/models/transcription_model.dart';
import 'package:lingua/features/sentence/domain/entities/translation.dart';

import 'audio_model.dart';

class TranslationModel {
  final int? id;
  final String? text;
  final String? lang;
  final String? license;
  final bool? isDirect;
  final List<AudioModel>? audios;
  final List<TranscriptionModel>? transcriptions;
  final String? owner;

  TranslationModel({
    this.id,
    this.text,
    this.lang,
    this.license,
    this.isDirect,
    this.audios,
    this.transcriptions,
    this.owner,
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

  Translation toEntity() => Translation(
    id: id ?? 0,
    text: text ?? '',
    lang: lang ?? '',
    license: license ?? '',
    isDirect: isDirect ?? false,
    audios: audios!.map((model) => model.toEntity()).toList(),
    transcriptions: transcriptions!.map((model) => model.toEntity()).toList(),
    owner: owner ?? '',
  );
}
