import 'package:flutter/material.dart';

class CountryEmojiWidget extends StatelessWidget {
  const CountryEmojiWidget({super.key, required this.langCode});

  final String langCode;

  @override
  Widget build(BuildContext context) {
    String getLanguageEmoji(String langCode) {
      final Map<String, String> langToEmoji = {
        'eng': '🇬🇧',
        'spa': '🇪🇸',
        'fra': '🇫🇷',
        'deu': '🇩🇪',
        'ita': '🇮🇹',
        'por': '🇵🇹',
        'rus': '🇷🇺',
        'jpn': '🇯🇵',
        'kor': '🇰🇷',
        'cmn': '🇨🇳',
        'ara': '🇸🇦',
        'tur': '🇹🇷',
        'pol': '🇵🇱',
        'nld': '🇳🇱',
        'swe': '🇸🇪',
        'fin': '🇫🇮',
        'heb': '🇮🇱',
        'ell': '🇬🇷',
        'ukr': '🇺🇦',
        'ces': '🇨🇿',
        'hun': '🇭🇺',
        'ber': '🇲🇦',
        'epo': '⭐',
        'lat': '🏛️',
      };
      return langToEmoji[langCode] ?? '🌐';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            getLanguageEmoji(langCode),
            style: const TextStyle(fontSize: 11),
          ),
          const SizedBox(width: 6),
          Text(
            langCode.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
