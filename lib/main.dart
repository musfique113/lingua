import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/core/blocs/connectivity/connectivity_bloc.dart';
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SentenceBloc>()),
          BlocProvider(create: (context) => getIt<ConnectivityBloc>()),
        ],
        child: BlocListener<ConnectivityBloc, ConnectivityState>(
          listenWhen: (previous, current) {
            return previous.isConnected != current.isConnected;
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.isConnected
                      ? 'Internet Connected'
                      : 'No Internet Connection',
                ),
                backgroundColor: state.isConnected ? Colors.green : Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          },
          child: const SentenceDetailScreen(),
        ),
      ),
    );
  }
}
