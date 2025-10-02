import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_content_widget.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_loading_widget.dart';

class SentenceDetailScreen extends StatelessWidget {
  const SentenceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<SentenceBloc, SentenceState>(
        builder: (context, state) {
          final isLoading = state is SentenceLoading;
          return FloatingActionButton.extended(
            onPressed: isLoading
                ? null
                : () {
                    context.read<SentenceBloc>().add(LoadRandomSentence());
                  },
            backgroundColor: isLoading
                ? Colors.grey
                : Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            label: Row(
              children: [
                const Icon(Icons.shuffle, size: 18),
                SizedBox(width: 9),
                Text('Random Sentence'),
              ],
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading sentence',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<SentenceBloc>().add(
                            LoadRandomSentence(),
                          );
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Try Again'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
