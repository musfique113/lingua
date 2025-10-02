import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:lingua/core/constants/app_constant.dart';
import 'package:lingua/core/network/network_executor.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';

class TatoebaRemoteDataSourceImpl implements TatoebaRemoteDataSource {
  final NetworkExecutor networkExecutor;
  final Random _random = Random();

  TatoebaRemoteDataSourceImpl({required this.networkExecutor});

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    final Map<String, dynamic> queryParameters = {
      'from': 'eng',
      'has_audio': 'yes',
      'sort': 'random',
    };

    try {
      final response = await networkExecutor.get(
        '${AppConstant.baseUrl}eng/api_v0/search',
        queryParameters: queryParameters,
      );

      final results = response['results'] as List;

      if (results.isNotEmpty) {
        final randomSentence = results[_random.nextInt(results.length)];
        return SentenceModel.fromJson(randomSentence);
      } else {
        throw Exception('No sentences found.');
      }
    } catch (e) {
      debugPrint('Failed to fetch random sentence: $e');
      throw Exception('Failed to fetch a random sentence.');
    }
  }
}
