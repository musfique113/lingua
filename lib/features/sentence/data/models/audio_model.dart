import '../../domain/entities/audio.dart';

class AudioModel extends Audio {
  const AudioModel({
    required super.id,
    required super.author,
    required super.downloadUrl,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'] ?? 0,
      author: json['author'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }
}
