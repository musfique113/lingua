import '../../domain/entities/audio.dart';

class AudioModel {
  final int? id;
  final String? author;
  final String? downloadUrl;

  const AudioModel({
    required this.id,
    required this.author,
    required this.downloadUrl,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'] as int?,
      author: json['author'] as String?,
      downloadUrl: json['download_url'] as String?,
    );
  }

  Audio toEntity() =>
      Audio(id: id ?? 0, author: author ?? '', downloadUrl: downloadUrl ?? '');
}
