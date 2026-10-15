import 'package:flutter_test/flutter_test.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  test('translation audio URLs use the absolute verse number', () {
    expect(
      quran.getEnglishAudioURLByVerse(2, 1),
      'https://cdn.islamic.network/quran/audio/192/en.walk/8.mp3',
    );
    expect(
      quran.getRussianAudioURLByVerse(114, 6),
      'https://cdn.islamic.network/quran/audio/128/ru.kuliev-audio/6236.mp3',
    );
  });
}
