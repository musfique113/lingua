import 'package:lingua/features/sentence/data/models/sentence_model.dart';

abstract class SentenceLocalDataSource {
  Future<SentenceModel> getCachedSentence();

  Future<void> cacheSentence(SentenceModel sentenceToCache);
}
