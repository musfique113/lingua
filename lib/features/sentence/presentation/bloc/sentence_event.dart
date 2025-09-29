import 'package:equatable/equatable.dart';

abstract class SentenceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadRandomSentence extends SentenceEvent {}