import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/di.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';
import 'package:lingua/features/sentence/presentation/pages/sentence_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingua',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1A1A1A)),
      home: BlocProvider(
        create: (context) => getIt<SentenceBloc>()..add(LoadRandomSentence()),
        child: const SentenceDetailScreen(),
      ),
    );
  }
}
