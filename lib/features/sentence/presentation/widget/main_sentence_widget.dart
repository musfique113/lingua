import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

class MainSentenceWidget extends StatelessWidget {
  final SentenceModel sentence;

  const MainSentenceWidget({super.key, required this.sentence});

  @override
  Widget build(BuildContext context) {
    // Check if audios list is not empty and get download URL
    final hasAudio = sentence.audios.isNotEmpty;
    final audioUrl = hasAudio
        ? 'https://api.tatoeba.org/unstable/audio/${sentence.audios.first.id}/file'
        : null;

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
                sentence.license,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              InkWell(
                onTap: hasAudio
                    ? () {
                        context.read<SentenceBloc>().add(
                          PlayAudioEvent(audioUrl!),
                        );
                      }
                    : null,
                child: Icon(
                  Icons.play_arrow,
                  size: 32,
                  color: hasAudio ? Colors.black : Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                hasAudio ? 'Audio available' : 'No audio available',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
