import 'package:flutter/material.dart';
import 'package:lingua/features/sentence/presentation/pages/sentence_details_screen.dart';

class AppRoutes {
  static const String sentenceDetails = '/';

  static final routes = <String, WidgetBuilder>{
    sentenceDetails: (context) => const SentenceDetailScreen(),
  };
}
