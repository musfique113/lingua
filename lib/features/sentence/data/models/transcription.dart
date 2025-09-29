class Transcription {
  final String script;
  final String text;
  final String? html;

  Transcription({
    required this.script,
    required this.text,
    this.html,
  });

  factory Transcription.fromJson(Map<String, dynamic> json) {
    return Transcription(
      script: json['script'],
      text: json['text'],
      html: json['html'],
    );
  }
}