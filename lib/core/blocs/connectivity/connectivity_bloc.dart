import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late final StreamSubscription _subscription;

  ConnectivityBloc(this._connectivity)
    : super(const ConnectivityState.initial()) {
    on<ConnectivityChanged>(_onConnectivityChanged);
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      final result = results.first;
      add(ConnectivityChanged(result));
    });
  }

  void _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    if (event.result == ConnectivityResult.none) {
      emit(const ConnectivityState.disconnected());
    } else {
      emit(const ConnectivityState.connected());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
