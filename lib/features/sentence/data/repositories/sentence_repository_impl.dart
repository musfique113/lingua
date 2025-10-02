import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/sentence_local_datasource.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final TatoebaRemoteDataSource remoteDataSource;
  final SentenceLocalDataSource localDataSource;

  SentenceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    try {
      final remoteSentence = await remoteDataSource.fetchRandomSentence();
      await localDataSource.cacheSentence(remoteSentence);
      return remoteSentence;
    } catch (e) {
      return await localDataSource.getCachedSentence();
    }
  }
}
