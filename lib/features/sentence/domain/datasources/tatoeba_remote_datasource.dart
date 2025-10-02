import 'package:lingua/features/sentence/data/models/sentence_model.dart';

abstract class TatoebaRemoteDataSource {
  Future<SentenceModel> fetchRandomSentence();
}
