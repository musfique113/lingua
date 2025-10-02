import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lingua/features/sentence/data/models/sentence_model.dart';
import 'package:lingua/features/sentence/domain/datasources/sentence_local_datasource.dart';
import 'dart:math';

class SentenceLocalDataSourceImpl implements SentenceLocalDataSource {
  static const String _cacheKey = 'sentences_cache';
  final CacheManager cacheManager;
  final Random _random = Random();

  SentenceLocalDataSourceImpl({required this.cacheManager});

  @override
  Future<void> cacheSentence(SentenceModel sentenceToCache) async {
    List<SentenceModel> cachedSentences = await _getCachedSentences();
    cachedSentences.add(sentenceToCache);
    final jsonList = cachedSentences
        .map((sentence) => sentence.toJson())
        .toList();
    final jsonString = jsonEncode(jsonList);
    final bytes = utf8.encode(jsonString);
    await cacheManager.putFile(_cacheKey, bytes, fileExtension: 'json');
  }

  @override
  Future<SentenceModel> getCachedSentence() async {
    final sentences = await _getCachedSentences();

    if (sentences.isNotEmpty) {
      return sentences[_random.nextInt(sentences.length)];
    } else {
      throw Exception('Cache Error: No sentences found in cache.');
    }
  }

  Future<List<SentenceModel>> _getCachedSentences() async {
    final fileInfo = await cacheManager.getFileFromCache(_cacheKey);

    if (fileInfo != null && await fileInfo.file.exists()) {
      final jsonString = await fileInfo.file.readAsString();
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.map((json) => SentenceModel.fromJson(json)).toList();
    }
    return [];
  }
}
