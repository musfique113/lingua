class Audio {
  final int id;
  final String author;
  final String downloadUrl;

  Audio({
    required this.id,
    required this.author,
    required this.downloadUrl,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      id: json['id'],
      author: json['author'],
      downloadUrl: json['download_url'],
    );
  }
}