import 'package:flutter_test/flutter_test.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  group('getVerseCountByPage', () {
    test('counts the verses on a page that does not start at verse 1', () {
      // Page 3 holds Surah 2, verses 6-16.
      expect(quran.getPageData(3), [
        {"surah": 2, "start": 6, "end": 16}
      ]);
      expect(quran.getVerseCountByPage(3), 11);
    });

    test('counts the verses on a page that starts at verse 1', () {
      expect(quran.getVerseCountByPage(1), 7); // Surah 1, verses 1-7
    });

    test('sums every page to the total verse count of the Quran', () {
      var sum = 0;
      for (var page = 1; page <= quran.totalPagesCount; page++) {
        sum += quran.getVerseCountByPage(page);
      }
      expect(sum, quran.totalVerseCount);
    });

    test('counts across every Surah on a page with more than one', () {
      final page = List.generate(quran.totalPagesCount, (i) => i + 1)
          .firstWhere((p) => quran.getSurahCountByPage(p) > 1);
      final expected = quran
          .getPageData(page)
          .fold<int>(0, (sum, e) => sum + (e["end"] as int) - (e["start"] as int) + 1);

      expect(quran.getVerseCountByPage(page), expected);
    });

    test('throws on an invalid pageNumber', () {
      expect(() => quran.getVerseCountByPage(0), throwsA(isA<String>()));
      expect(() => quran.getVerseCountByPage(605), throwsA(isA<String>()));
    });
  });
}
