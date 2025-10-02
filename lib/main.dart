import 'package:flutter/material.dart';
import 'package:lingua/app/app.dart';
import 'package:lingua/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}
