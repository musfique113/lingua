import 'package:lingua/features/sentence/domain/entities/sentence.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';

class GetRandomSentence {
  final SentenceRepository repository;

  GetRandomSentence(this.repository);

  Future<Sentence> call() async {
    return await repository.fetchRandomSentence();
  }
}
