import 'package:equatable/equatable.dart';

class Transcription extends Equatable {
  final String script;
  final String text;
  final String html;

  const Transcription({
    required this.script,
    required this.text,
    required this.html,
  });

  @override
  List<Object?> get props => [script, text, html];
}
