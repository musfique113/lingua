import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';

class GetRandomSentence {
  final SentenceRepository repository;

  GetRandomSentence(this.repository);

  Future<SentenceModel> call() async {
    return await repository.fetchRandomSentence();
  }
}
