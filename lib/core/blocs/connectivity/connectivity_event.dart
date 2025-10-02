part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object?> get props => [];
}

class ConnectivityChanged extends ConnectivityEvent {
  final ConnectivityResult result;

  const ConnectivityChanged(this.result);

  @override
  List<Object?> get props => [result];
}
