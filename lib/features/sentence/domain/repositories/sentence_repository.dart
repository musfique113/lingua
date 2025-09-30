import 'package:lingua/features/sentence/domain/entities/sentence.dart';

abstract class SentenceRepository {
  Future<Sentence> fetchRandomSentence();
}
