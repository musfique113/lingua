import 'package:lingua/features/sentence/domain/entities/transcription.dart';

class TranscriptionModel {
  final String? script;
  final String? text;
  final String? html;

  TranscriptionModel({this.script, this.text, this.html});

  factory TranscriptionModel.fromJson(Map<String, dynamic> json) {
    return TranscriptionModel(
      script: json['script'] ?? '',
      text: json['text'] ?? '',
      html: json['html'] ?? '',
    );
  }

  Transcription toEntity() =>
      Transcription(script: script ?? '', text: text ?? '', html: html ?? '');
}
