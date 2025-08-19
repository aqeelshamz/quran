## 1.4.1
* Analysis Issue fixes
## 1.4.0
* **Memory**: Reduced memory footprint by eliminating redundant key storage
* **API**: All existing function signatures remain compatible - no code changes required for users
* Quran script is updated from tanzil.net with the simple (plain) option
* Data structure: `quranText` List replaced with `quranData` Map<int, Map<int, String>>
* Updated `getVerse()`, `getAudioURLByVerse()`, and `searchWords()` functions for optimal performance
* Fixed redundant default cases in translation switch statements
* Fixed ios example project build issue
* Reciters: Added `Reciter` enum with many supported identifiers (e.g., ar.alafasy, ar.husary, ar.minshawi, ar.shaatree, ar.abdullahbasfar, ar.abdurrahmaansudais, ar.abdulbasitmurattal, ar.hudhaify, ar.mahermuaiqly, ar.muhammadjibreel, etc.)
* Display: Each enum value now includes `englishName` for UI display (e.g., "Alafasy", "Husary", "Abdurrahmaan As-Sudais")
* API: Audio URL helpers accept a reciter and bitrate while keeping defaults for backward compatibility
	* `getAudioURLBySurah(int surahNumber, { Reciter reciter = Reciter.arAlafasy, int bitrate = 128 })`
	* `getAudioURLByVerse(int surahNumber, int verseNumber, { Reciter reciter = Reciter.arAlafasy, int bitrate = 128 })`
	* `getAudioURLByVerseNumber(int verseNumber, { Reciter reciter = Reciter.arAlafasy, int bitrate = 128 })`
* Defaults preserved: Existing code continues to use Alafasy at 128 kbps without changes
* Reference: Reciter identifiers align with the editions list: https://api.alquran.cloud/v1/edition?format=audio

## 1.3.3
* Minor bug fixes

## 1.3.2
* Minor bug fixes

## 1.3.1
* New translations added - Spanish, Chinese, Indonesian, Urdu, Bengali, Swedish

## 1.3.0
* Updated dependencies

## 1.2.9
* Better Rendering - Replaced some punctuations for better rendering of Translation text (Clear Quran)
* Font Setup - Documentation & examples added for font setup for better rendering of Quranic text
* Examples - updated

## 1.2.8
* New translation added - Russian (Elmir Kuliev)

## 1.2.7
* RandomVerse class added

## 1.2.6
* New translations added - English (Clear Quran), Farsi, Portuguese, Italian, Dutch

## 1.2.5
* Updated dependencies
* arabicNumbers const changed (to new code units)

## 1.2.4
* SDK Version updated: >=2.12.0 <4.0.0
* Minor fixes (Tashkil)

## 1.2.3

* New translation added - French (Muhammad Hamidullah)
* Minor fixes

## 1.2.2

* New translation added - Malayalam (Translation edition: Cheriyamundam Abdul Hameed and Kunhi Mohammed Parappoor)
* Fixed Typo - Surah Al Masad Arabic name

## 1.2.1

* New translation added - Turkish
* Fixed Typo - Surah An Naba Arabic name
* New Function added: `getSurahNameTurkish` - Get surah name in Turkish

## 1.2.0

* `searchWords` - Search words in Arabic Quran text
* `searchWordsInTranslation` - Search words in Translation

## 1.1.9

* Fixed some words that did not appeared correctly

## 1.1.8

* getVerseEndSymbol issue fixed.

## 1.1.7

* New translation added - Saheeh International (English)
* `getVerseTranslation` - Get verse translation
* Added `arabicNumeral` parameter to `getVerseEndSymbol`

## 1.1.6

* `sajdah` - Returns constant 'سَجْدَةٌ'
* removed `getSajdahText`

## 1.1.5

* `isSajdahVerse` - Check if a verse is sajdah verse
* `getSajdahText` - Returns sajdah in arabic text

## 1.1.4

* Get Quran audio URLs (from Al Quran CDN): 
* `getAudioURLBySurah` - Get surah audio URL from surah number
* `getAudioURLByVerse` - Get verse audio URL from surah number and verse number
* `getAudioURLByVerseNumber` - Get verse audio URL from verse number

## 1.1.3

* `getPageNumber` - Get page number from surah number and verse number

## 1.1.1

* `getVersesTextByPage` - Get verses text in a page
* `getSurahPages` - Get surah pages list
* Page Data errors corrected & Bugs fixed

## 1.1.0

* Format

## 1.0.8

* Improvements

## 1.0.7

* Bug fix - `getVerseEndSymbol` verse number is not inside the symbol

## 1.0.6

* Page Data Bug fix

## 1.0.5

* New Functions added:
* `getSurahNameArabic` - Get surah name in Arabic
* `getPageData` - Get surah and verses in a page
* `getTotalPagesCount` - Get total pages count
* `getSurahCountByPage` - Get total surahs count in a page
* `getVerseCountByPage` - Get total verses count in a page

## 1.0.3

- Bug fix

## 1.0.2

* Get Verse end symbol '۝' with verse number
* `verseEndSymbol` bool added in `getVerse` function

## 1.0.1

* Get Juz Number
* Get Juz URL
* Get Surah and Verse numbers from Juz

## 1.0.0

* Get Surah and Verse URLs (from Quran.com)

## 0.0.7

* Get Surah english titles and place of revelation (Makkah / Madinah)

## 0.0.6

* Get total aya and surah count

## 0.1.0

* Basmala removed from first ayas
* Get Basmala function added

## 0.0.1

* Initial release.