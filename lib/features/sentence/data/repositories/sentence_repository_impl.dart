import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final TatoebaRemoteDataSource remoteDataSource;

  SentenceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    return await remoteDataSource.fetchRandomSentence();
  }
}
