import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/sentence_local_datasource.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';
import 'package:lingua/core/blocs/connectivity/connectivity_bloc.dart';

class SentenceRepositoryImpl implements SentenceRepository {
  final TatoebaRemoteDataSource remoteDataSource;
  final SentenceLocalDataSource localDataSource;
  final ConnectivityBloc connectivityBloc;

  SentenceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivityBloc,
  });

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    final isConnected = connectivityBloc.state.isConnected;

    if (isConnected) {
      try {
        final remoteSentence = await remoteDataSource.fetchRandomSentence();
        await localDataSource.cacheSentence(remoteSentence);
        return remoteSentence;
      } catch (e) {
        return await localDataSource.getCachedSentence();
      }
    } else {
      return await localDataSource.getCachedSentence();
    }
  }
}
