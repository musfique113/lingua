import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key, required this.audioUrl});

  final String audioUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SentenceBloc, SentenceState>(
      builder: (context, state) {
        final isPlaying = state is AudioPlaying && state.url == audioUrl;
        final isLoading = state is AudioLoading && state.url == audioUrl;

        return InkWell(
          onTap: !isLoading
              ? () {
                  if (isPlaying) {
                    context.read<SentenceBloc>().add(StopAudioEvent());
                  } else {
                    context.read<SentenceBloc>().add(PlayAudioEvent(audioUrl!));
                  }
                }
              : null,
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF7C3AED),
                    ),
                  ),
                )
              : Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 24,
                  color: const Color(0xFF7C3AED),
                ),
        );
      },
    );
  }
}
