import 'package:quran/quran.dart';
import 'package:test/test.dart';

main() {
  test(
    'should return page number of surah and verse number',
    () async {
      // arrange
      const surahNumber = 11;
      const verseNumber = 1;

      // act
      final result = getPageNumber(surahNumber, verseNumber);

      // assert
      expect(result, 221);
    },
  );
}
