import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_event.dart';
import 'package:lingua/features/sentence/presentation/pages/sentence_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingua',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        fontFamily: 'Roboto',
      ),
      home: BlocProvider(
        create: (context) => SentenceBloc(
          repository: TatoebaRepository(),
        )..add(LoadRandomSentence()),
        child: const SentenceDetailScreen(),
      ),
    );
  }
}
