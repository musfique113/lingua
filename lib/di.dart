import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:lingua/core/network/network_executor.dart';
import 'package:lingua/features/sentence/data/datasources/tatoeba_remote_datasource_impl.dart';
import 'package:lingua/features/sentence/data/repositories/sentence_repository_impl.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/repositories/sentence_repository.dart';
import 'package:lingua/features/sentence/domain/usecases/get_random_sentence.dart';
import 'package:lingua/features/sentence/domain/usecases/play_audio.dart';
import 'package:lingua/features/sentence/presentation/bloc/sentence_bloc.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => NetworkExecutor(http.Client()));
  getIt.registerLazySingleton(() => AudioPlayer());

  getIt.registerLazySingleton<SentenceRepository>(
    () => SentenceRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<TatoebaRemoteDataSource>(
    () => TatoebaRemoteDataSourceImpl(networkExecutor: getIt()),
  );

  getIt.registerLazySingleton(() => GetRandomSentence(getIt()));
  getIt.registerLazySingleton(() => PlayAudio(getIt()));

  getIt.registerFactory(
    () => SentenceBloc(
      getRandomSentence: getIt<GetRandomSentence>(),
      playAudio: getIt<PlayAudio>(),
    ),
  );
}
