class SentenceModel {
  SentenceModel({
    required this.id,
    required this.text,
    required this.lang,
    required this.correctness,
    required this.script,
    required this.license,
    required this.translations,
    required this.transcriptions,
    required this.audios,
    required this.langName,
    required this.dir,
    required this.langTag,
    required this.isFavorite,
    required this.isOwnedByCurrentUser,
    required this.permissions,
    required this.maxVisibleTranslations,
    required this.currentUserReview,
  });

  final int id;
  final String text;
  final String lang;
  final num correctness;
  final dynamic script;
  final String license;
  final List<List<Translation>> translations;
  final List<dynamic> transcriptions;
  final List<ResultAudio> audios;
  final String langName;
  final String dir;
  final String langTag;
  final dynamic isFavorite;
  final bool isOwnedByCurrentUser;
  final dynamic permissions;
  final num maxVisibleTranslations;
  final dynamic currentUserReview;

  factory SentenceModel.fromJson(Map<String, dynamic> json) {
    return SentenceModel(
      id: json["id"] ?? 0,
      text: json["text"] ?? "",
      lang: json["lang"] ?? "",
      correctness: json["correctness"] ?? 0,
      script: json["script"],
      license: json["license"] ?? "",
      translations: json["translations"] == null
          ? []
          : List<List<Translation>>.from(
              json["translations"]!.map(
                (x) => x == null
                    ? []
                    : List<Translation>.from(
                        x!.map((x) => Translation.fromJson(x)),
                      ),
              ),
            ),
      transcriptions: json["transcriptions"] == null
          ? []
          : List<dynamic>.from(json["transcriptions"]!.map((x) => x)),
      audios: json["audios"] == null
          ? []
          : List<ResultAudio>.from(
              json["audios"]!.map((x) => ResultAudio.fromJson(x)),
            ),
      langName: json["lang_name"] ?? "",
      dir: json["dir"] ?? "",
      langTag: json["lang_tag"] ?? "",
      isFavorite: json["is_favorite"],
      isOwnedByCurrentUser: json["is_owned_by_current_user"] ?? false,
      permissions: json["permissions"],
      maxVisibleTranslations: json["max_visible_translations"] ?? 0,
      currentUserReview: json["current_user_review"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "lang": lang,
      "correctness": correctness,
      "script": script,
      "license": license,
      "translations": translations
          .map((list) => list.map((x) => x.toJson()).toList())
          .toList(),
      "transcriptions": transcriptions,
      "audios": audios.map((x) => x.toJson()).toList(),
      "lang_name": langName,
      "dir": dir,
      "lang_tag": langTag,
      "is_favorite": isFavorite,
      "is_owned_by_current_user": isOwnedByCurrentUser,
      "permissions": permissions,
      "max_visible_translations": maxVisibleTranslations,
      "current_user_review": currentUserReview,
    };
  }
}

class ResultAudio {
  ResultAudio({
    required this.id,
    required this.author,
    required this.attributionUrl,
    required this.license,
  });

  final int id;
  final String author;
  final dynamic attributionUrl;
  final dynamic license;

  factory ResultAudio.fromJson(Map<String, dynamic> json) {
    return ResultAudio(
      id: json["id"] ?? 0,
      author: json["author"] ?? "",
      attributionUrl: json["attribution_url"],
      license: json["license"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "author": author,
      "attribution_url": attributionUrl,
      "license": license,
    };
  }
}

class Translation {
  Translation({
    required this.id,
    required this.text,
    required this.lang,
    required this.correctness,
    required this.script,
    required this.transcriptions,
    required this.audios,
    required this.isDirect,
    required this.langName,
    required this.dir,
    required this.langTag,
  });

  final int id;
  final String text;
  final String lang;
  final num correctness;
  final dynamic script;
  final List<dynamic> transcriptions;
  final List<TranslationAudio> audios;
  final bool isDirect;
  final String langName;
  final String dir;
  final String langTag;

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json["id"] ?? 0,
      text: json["text"] ?? "",
      lang: json["lang"] ?? "",
      correctness: json["correctness"] ?? 0,
      script: json["script"],
      transcriptions: json["transcriptions"] == null
          ? []
          : List<dynamic>.from(json["transcriptions"]!.map((x) => x)),
      audios: json["audios"] == null
          ? []
          : List<TranslationAudio>.from(
              json["audios"]!.map((x) => TranslationAudio.fromJson(x)),
            ),
      isDirect: json["isDirect"] ?? false,
      langName: json["lang_name"] ?? "",
      dir: json["dir"] ?? "",
      langTag: json["lang_tag"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "lang": lang,
      "correctness": correctness,
      "script": script,
      "transcriptions": transcriptions,
      "audios": audios.map((x) => x.toJson()).toList(),
      "isDirect": isDirect,
      "lang_name": langName,
      "dir": dir,
      "lang_tag": langTag,
    };
  }
}

class TranslationAudio {
  TranslationAudio({
    required this.id,
    required this.author,
    required this.attributionUrl,
    required this.license,
    required this.audioExternal,
    required this.sentenceId,
  });

  final int id;
  final String author;
  final dynamic attributionUrl;
  final dynamic license;
  final dynamic audioExternal;
  final int sentenceId;

  factory TranslationAudio.fromJson(Map<String, dynamic> json) {
    return TranslationAudio(
      id: json["id"] ?? 0,
      author: json["author"] ?? "",
      attributionUrl: json["attribution_url"],
      license: json["license"],
      audioExternal: json["external"],
      sentenceId: json["sentence_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "author": author,
      "attribution_url": attributionUrl,
      "license": license,
      "external": audioExternal,
      "sentence_id": sentenceId,
    };
  }
}
