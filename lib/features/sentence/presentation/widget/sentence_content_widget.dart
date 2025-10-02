import 'package:flutter/material.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/presentation/widget/main_sentence_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/translation_widget.dart';

class SentenceContentWidget extends StatelessWidget {
  final SentenceModel sentence;

  const SentenceContentWidget({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    final flatTranslations = sentence.translations
        .expand((group) => group)
        .take(10)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainSentenceWidget(sentence: sentence),
              if (flatTranslations.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  '🌐 Translations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (flatTranslations.isNotEmpty) ...[
                  ...flatTranslations.map(
                    (translation) =>
                        TranslationWidget(translation: translation),
                  ),
                ] else
                  SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
