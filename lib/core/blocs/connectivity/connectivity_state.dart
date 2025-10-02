part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  final bool isConnected;

  const ConnectivityState._({required this.isConnected});

  const ConnectivityState.initial() : this._(isConnected: true);

  const ConnectivityState.connected() : this._(isConnected: true);

  const ConnectivityState.disconnected() : this._(isConnected: false);

  @override
  List<Object?> get props => [isConnected];
}
