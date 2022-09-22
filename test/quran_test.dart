import 'package:quran/quran.dart';
import 'package:test/test.dart';

main() {
  test(
    'should return page number of surah and verse number',
    () async {
      // arrange
      final surahNumber = 1;
      final verseNumber = 4;

      // act
      final result = getPageNumber(surahNumber, verseNumber);

      // assert
      expect(result, 1);
    },
  );
}
