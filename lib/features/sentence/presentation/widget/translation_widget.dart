import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/widget/audio_player_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/country_emoji_widget.dart';

class TranslationWidget extends StatelessWidget {
  final Translation translation;

  const TranslationWidget({super.key, required this.translation});

  @override
  Widget build(BuildContext context) {
    final hasTranscription = translation.transcriptions.isNotEmpty;
    final transcription = hasTranscription
        ? translation.transcriptions.firstWhere(
            (t) => t['script'] == 'Hrkt' || t['script'] == 'Latn',
            orElse: () => translation.transcriptions.first,
          )
        : null;

    final hasAudio = translation.audios.isNotEmpty;
    final audioUrl = hasAudio
        ? 'https://api.tatoeba.org/unstable/audio/${translation.audios.first.id}/file'
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  translation.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Row(
                children: [
                  if (hasAudio) AudioPlayerWidget(audioUrl: audioUrl!),
                  if (hasTranscription) ...[
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF7C3AED)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.article_outlined,
                            size: 14,
                            color: Color(0xFF7C3AED),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            transcription!['script'] == 'Hrkt'
                                ? 'Furigana'
                                : 'Transcription',
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF7C3AED),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          CountryEmojiWidget(langCode: translation.lang),
          if (hasTranscription) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                transcription!['text'] ?? '',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
