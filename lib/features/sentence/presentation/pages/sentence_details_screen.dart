import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_content_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_error_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_loading_widget.dart';

class SentenceDetailScreen extends StatelessWidget {
  const SentenceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<SentenceBloc, SentenceState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
            onPressed:
                (state is SentenceLoading ||
                    state is AudioLoading ||
                    state is AudioPlaying)
                ? null
                : () {
                    context.read<SentenceBloc>().add(LoadRandomSentence());
                  },
            backgroundColor: (state is SentenceLoading || state is AudioLoading)
                ? Colors.grey
                : const Color(0xFF7C3AED),
            foregroundColor: Colors.white,
            label: Row(
              children: const [
                Icon(Icons.shuffle, size: 18),
                SizedBox(width: 9),
                Text('New Sentence'),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: BlocBuilder<SentenceBloc, SentenceState>(
            builder: (context, state) {
              if (state is SentenceInitial) {
                context.read<SentenceBloc>().add(LoadRandomSentence());
                return const SentenceLoadingWidget();
              } else if (state is SentenceLoading) {
                return const SentenceLoadingWidget();
              } else if (state is SentenceLoaded) {
                return SentenceContentWidget(sentence: state.sentence);
              } else if (state is AudioLoading) {
                return SentenceContentWidget(sentence: state.sentence);
              } else if (state is AudioPlaying) {
                return SentenceContentWidget(sentence: state.sentence);
              } else if (state is SentenceError) {
                return SentenceErrorWidget(state: state);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
