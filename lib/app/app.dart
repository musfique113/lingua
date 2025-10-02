import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingua/core/blocs/connectivity/connectivity_bloc.dart';
import 'package:lingua/di.dart';
import 'package:lingua/app/routes.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SentenceBloc>()),
        BlocProvider(create: (context) => getIt<ConnectivityBloc>()),
      ],
      child: MaterialApp(
        title: 'Lingua',
        initialRoute: AppRoutes.sentenceDetails,
        routes: AppRoutes.routes,
        builder: (context, child) {
          return BlocListener<ConnectivityBloc, ConnectivityState>(
            listenWhen: (previous, current) {
              return previous.isConnected != current.isConnected;
            },
            listener: (context, state) {
              _showNoInternetToast(context, state);
            },
            child: child!,
          );
        },
      ),
    );
  }

  void _showNoInternetToast(BuildContext context, ConnectivityState state) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          state.isConnected ? 'Internet Connected' : 'No Internet Connection',
        ),
        backgroundColor: state.isConnected ? Colors.green : Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
