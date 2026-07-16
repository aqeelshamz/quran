import 'package:flutter_test/flutter_test.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  group('getBasmala', () {
    test('returns null for Surah 1, whose Basmala is verse 1 itself', () {
      expect(quran.getBasmala(1), isNull);
    });

    test('returns null for Surah 9, which has no Basmala', () {
      expect(quran.getBasmala(9), isNull);
    });

    test('matches the script used by the verse text', () {
      expect(quran.getBasmala(2), quran.getVerse(1, 1));
    });

    test('throws on an invalid surahNumber', () {
      expect(() => quran.getBasmala(0), throwsA(isA<String>()));
      expect(() => quran.getBasmala(115), throwsA(isA<String>()));
    });
  });

  group('getVerse includeBasmala', () {
    test('defaults to including the Basmala', () {
      expect(quran.getVerse(2, 1), startsWith(quran.getBasmala(2)!));
      expect(quran.getVerse(2, 1), quran.getVerse(2, 1, includeBasmala: true));
    });

    test('strips the Basmala from verse 1 of every Surah that has one', () {
      for (var surah = 1; surah <= 114; surah++) {
        final basmala = quran.getBasmala(surah);
        final stripped = quran.getVerse(surah, 1, includeBasmala: false);

        expect(stripped, isNotEmpty, reason: 'surah $surah verse 1 is empty');
        if (basmala != null) {
          expect(stripped, isNot(startsWith(basmala)),
              reason: 'surah $surah verse 1 kept its Basmala');
          expect(quran.getVerse(surah, 1), '$basmala $stripped',
              reason: 'surah $surah verse 1 lost more than its Basmala');
        } else {
          expect(stripped, quran.getVerse(surah, 1),
              reason: 'surah $surah has no Basmala to strip');
        }
      }
    });

    test('leaves verses other than verse 1 untouched', () {
      // Verse 27:30 quotes the Basmala mid-verse; it must survive.
      expect(
          quran.getVerse(27, 30, includeBasmala: false), quran.getVerse(27, 30));
      expect(quran.getVerse(27, 30, includeBasmala: false),
          contains(quran.getBasmala(27)!));
    });

    test('composes with verseEndSymbol', () {
      expect(
        quran.getVerse(2, 1, includeBasmala: false, verseEndSymbol: true),
        quran.getVerse(2, 1, includeBasmala: false) +
            quran.getVerseEndSymbol(1),
      );
    });
  });

  group('getVersesTextByPage', () {
    test('passes includeBasmala through to the verses', () {
      // Page 2 starts Surah 2 (Al-Baqarah) at verse 1.
      final withBasmala = quran.getVersesTextByPage(2);
      final without = quran.getVersesTextByPage(2, includeBasmala: false);

      expect(withBasmala.first, startsWith(quran.getBasmala(2)!));
      expect(without.first, isNot(startsWith(quran.getBasmala(2)!)));
      expect(without.length, withBasmala.length);
    });
  });
}
