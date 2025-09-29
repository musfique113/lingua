import 'package:lingua/features/sentence/data/models/transcription.dart';

import 'audio_model.dart';

class Translation {
  final int id;
  final String text;
  final String lang;
  final String? license;
  final bool isDirect;
  final List<Audio> audios;
  final List<Transcription> transcriptions;
  final String owner;

  Translation({
    required this.id,
    required this.text,
    required this.lang,
    this.license,
    required this.isDirect,
    required this.audios,
    required this.transcriptions,
    required this.owner,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      text: json['text'],
      lang: json['lang'],
      license: json['license'],
      isDirect: json['is_direct'],
      audios: (json['audios'] as List)
          .map((a) => Audio.fromJson(a))
          .toList(),
      transcriptions: (json['transcriptions'] as List)
          .map((t) => Transcription.fromJson(t))
          .toList(),
      owner: json['owner'],
    );
  }
}