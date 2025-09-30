import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/widget/sentence_content_widget.dart';

class SentenceDetailScreen extends StatelessWidget {
  const SentenceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.translate),
        title: const Text('Lingua'),
      ),
      body: BlocBuilder<SentenceBloc, SentenceState>(
        builder: (context, state) {
          if (state is SentenceLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is SentenceLoaded) {
            return SentenceContentWidget(sentence: state.sentence);
          } else if (state is SentenceError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
