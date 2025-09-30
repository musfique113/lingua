
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

class MainSentenceWidget extends StatelessWidget {
  final Sentence sentence;

  const MainSentenceWidget({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sentence.text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  sentence.lang.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Contributor: ${sentence.owner}',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Text(
                sentence.license ?? '',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              if (sentence.audios.isNotEmpty)
                InkWell(
                  onTap: () {
                    context.read<SentenceBloc>().add(
                          PlayAudioEvent(sentence.audios.first.downloadUrl),
                        );
                  },
                  child: const Icon(Icons.play_arrow, size: 32),
                )
              else
                const Icon(Icons.play_arrow, size: 32, color: Colors.grey),
              const Spacer(),
              Text(
                sentence.audios.isNotEmpty
                    ? 'Audio available'
                    : 'No audio available',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
