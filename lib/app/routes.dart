import 'package:flutter/material.dart';
import 'package:lingua/features/sentence/presentation/pages/sentence_details_screen.dart';
import 'package:lingua/features/sentence/presentation/pages/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String sentenceDetails = '/sentence-details';

  static final routes = <String, WidgetBuilder>{
    splash: (context) => const SplashScreen(),
    sentenceDetails: (context) => const SentenceDetailScreen(),
  };
}
