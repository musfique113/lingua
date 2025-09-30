import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/tatoeba_remote_datasource.dart';

class TatoebaRemoteDataSourceImpl implements TatoebaRemoteDataSource {
  final http.Client client;

  TatoebaRemoteDataSourceImpl({required this.client});

  @override
  Future<SentenceModel> fetchRandomSentence() async {
    final randomId = DateTime.now().millisecondsSinceEpoch % 10000000;
    final response = await client.get(
      Uri.parse('https://api.tatoeba.org/unstable/sentences/$randomId'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SentenceModel.fromJson(json['data']);
    } else {
      throw Exception('Failed to load sentence');
    }
  }
}
