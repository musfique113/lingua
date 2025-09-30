import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final TatoebaRemoteDataSource remoteDataSource;

  SentenceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Sentence> fetchRandomSentence() async {
    return await remoteDataSource.fetchRandomSentence();
  }
}
