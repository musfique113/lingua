import 'package:flutter/foundation.dart';
import 'package:lingua/core/constants/app_constant.dart';
import 'package:lingua/core/network/network_executor.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';

class TatoebaRemoteDataSourceImpl implements TatoebaRemoteDataSource {
  final NetworkExecutor networkExecutor;

  TatoebaRemoteDataSourceImpl({required this.networkExecutor});

  String _urlPath(int randomId) => 'unstable/sentences/$randomId';

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    final randomId = DateTime.now().millisecondsSinceEpoch % 10000000;

    try {
      final response = await networkExecutor.get(
        '${AppConstant.baseUrl}${_urlPath(randomId)}',
      );

      return SentenceModel.fromJson(response['data']);
    } catch (e, stack) {
      debugPrintStack(label: e.toString(), stackTrace: stack);
      throw Exception('Error fetching random sentence: $e');
    }
  }
}
