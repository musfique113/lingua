import 'package:lingua/features/sentence/domain/entities/transcription.dart';

class TranscriptionModel extends Transcription {
  const TranscriptionModel({
    required super.script,
    required super.text,
    super.html,
  });

  factory TranscriptionModel.fromJson(Map<String, dynamic> json) {
    return TranscriptionModel(
      script: json['script'],
      text: json['text'],
      html: json['html'],
    );
  }
}
