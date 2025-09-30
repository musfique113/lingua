
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/widget/main_sentence_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/translation_widget.dart';

class SentenceContentWidget extends StatelessWidget {
  final Sentence sentence;

  const SentenceContentWidget({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sentence Detail',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<SentenceBloc>().add(LoadRandomSentence());
                  },
                  icon: const Icon(Icons.shuffle, size: 18),
                  label: const Text('Random'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainSentenceWidget(sentence: sentence),
                  const SizedBox(height: 32),
                  const Text(
                    'Translations',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  ...sentence.translations
                      .take(5)
                      .map((t) => TranslationWidget(translation: t)),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
