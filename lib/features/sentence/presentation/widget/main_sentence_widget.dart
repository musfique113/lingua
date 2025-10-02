import 'package:flutter/material.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/presentation/widget/audio_player_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/country_emoji_widget.dart';

class MainSentenceWidget extends StatelessWidget {
  final SentenceModel sentence;

  const MainSentenceWidget({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    final hasAudio = sentence.audios.isNotEmpty;
    final audioUrl = hasAudio
        ? 'https://api.tatoeba.org/unstable/audio/${sentence.audios.first.id}/file'
        : null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sentence.text,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CountryEmojiWidget(langCode: sentence.lang),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Contributor: ${sentence.audios.isNotEmpty ? sentence.audios.first.author : "Unknown"}',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  sentence.license,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasAudio) AudioPlayerWidget(audioUrl: audioUrl!),
              const Spacer(),
              Text(
                hasAudio ? 'Audio available' : 'No audio available',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
