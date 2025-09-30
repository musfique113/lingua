import 'package:equatable/equatable.dart';

class Audio extends Equatable {
  final int id;
  final String author;
  final String downloadUrl;

  const Audio({
    required this.id,
    required this.author,
    required this.downloadUrl,
  });

  @override
  List<Object?> get props => [id, author, downloadUrl];
}
