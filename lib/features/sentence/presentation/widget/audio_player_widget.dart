import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/core/blocs/connectivity/connectivity_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key, required this.audioUrl});

  final String audioUrl;

  @override
  Widget build(BuildContext context) {
    final isConnected = context.select<ConnectivityBloc, bool>(
      (bloc) => bloc.state.isConnected,
    );

    return BlocBuilder<SentenceBloc, SentenceState>(
      builder: (context, state) {
        final isPlaying = state is AudioPlaying && state.url == audioUrl;
        final isLoading = state is AudioLoading && state.url == audioUrl;

        void handleTap() {
          if (isPlaying) {
            context.read<SentenceBloc>().add(StopAudioEvent());
          } else {
            context.read<SentenceBloc>().add(PlayAudioEvent(audioUrl));
          }
        }

        return InkWell(
          onTap: (isConnected && !isLoading) ? handleTap : null,
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation(Color(0xFF7C3AED)),
                  ),
                )
              : Icon(
                  isPlaying ? Icons.stop_circle : Icons.play_arrow,
                  size: 24,
                  color: isConnected ? const Color(0xFF7C3AED) : Colors.grey,
                ),
        );
      },
    );
  }
}
