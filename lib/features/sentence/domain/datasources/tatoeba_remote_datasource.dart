import 'package:lingua/features/sentence/domain/entities/sentence.dart';

abstract class TatoebaRemoteDataSource {
  Future<Sentence> fetchRandomSentence();
}
