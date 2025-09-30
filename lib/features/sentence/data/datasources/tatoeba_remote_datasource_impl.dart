import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:lingua/core/constants/app_constant.dart';
import 'package:lingua/core/network/network_executor.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';
import 'package:lingua/features/sentence/domain/entities/sentence.dart';

class TatoebaRemoteDataSourceImpl implements TatoebaRemoteDataSource {
  final NetworkExecutor networkExecutor;
  final Random _random = Random();

  TatoebaRemoteDataSourceImpl({required this.networkExecutor});

  String _urlPath(int randomId) => 'unstable/sentences/$randomId';

  @override
  Future<Sentence> fetchRandomSentence() async {
    const int maxRetries = 10;

    for (int attempt = 0; attempt < maxRetries; attempt++) {
      final randomId = _random.nextInt(120000) + 1;

      try {
        debugPrint(
          'Attempt ${attempt + 1}: Fetching sentence with ID $randomId',
        );

        final response = await networkExecutor.get(
          '${AppConstant.baseUrl}${_urlPath(randomId)}',
        );
        return SentenceModel.fromJson(response['data']).toEntity();
      } catch (e) {
        debugPrint('Attempt ${attempt + 1} failed for ID $randomId: $e');
        if (attempt == maxRetries - 1) {
          debugPrint('All retry attempts failed.');
          throw Exception(
            'Failed to fetch a random sentence after $maxRetries attempts.',
          );
        }
      }
    }
    throw Exception('Failed to fetch a random sentence.');
  }
}
