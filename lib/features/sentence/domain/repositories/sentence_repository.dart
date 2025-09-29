import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/models/sentence_model.dart';

class TatoebaRepository {
  final http.Client client;

  TatoebaRepository({http.Client? client}) : client = client ?? http.Client();

  Future<SentenceData> fetchRandomSentence() async {
    // Using a random sentence ID for demonstration
    final random = DateTime.now().millisecondsSinceEpoch % 10000000;
    final response = await client.get(
      Uri.parse('https://api.tatoeba.org/unstable/sentences/$random'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return SentenceData.fromJson(json['data']);
    } else {
      throw Exception('Failed to load sentence');
    }
  }
}