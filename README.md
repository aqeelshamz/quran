Full Quran text and Surah details

## Getting Started

To use this plugin, add `quran` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

**Functions:**

* **`getJuzNumber(int surahNumber, int verseNumber)`** - Takes [surahNumber] & [verseNumber] and returns Juz number
* **`getSurahAndVersesFromJuz(int juzNumber)`** - Takes [juzNumber] and returns a map containing Surah and Verse numbers
* **`getSurahName(int surahNumber)`** - Takes [surahNumber] and returns the Surah name
* **`getSurahNameEnglish(int surahNumber)`** - Takes [surahNumber] returns the Surah name in English
* **`getPlaceOfRevelation(int surahNumber)`** - Takes [surahNumber] and returns the Place of Revelation (Makkah / Madinah) of the Surah
* **`getVerseCount(int surahNumber)`** - Takes [surahNumber] and returns the count of total Verses in the Surah
* **`getVerse(int surahNumber, int verseNumber, {bool verseEndSymbol})`** - Takes [surahNumber], [verseNumber] & [verseEndSymbol] (optional) and returns the Verse in Arabic
* **`getTotalJuzCount()`** - Returns total Juz count
* **`getTotalSurahCount()`** - Returns total Surah count
* **`getTotalVerseCount()`** - Returns total Verse count
* **`getBasmala()`** - Returns 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'
* **`getVerseEndSymbol()`** - Takes [verseNumber] and returns '۝' symbol with verse number
* **`getJuzURL(int juzNumber)`** - Takes [juzNumber] and returns Juz URL (from Quran.com)
* **`getSurahURL(int surahNumber)`** - Takes [surahNumber] and returns Surah URL (from Quran.com)
* **`getVerseURL(int surahNumber, int verseNumber)`** - Takes [surahNumber] & [verseNumber] and returns Verse URL (from Quran.com)

## Example
![example](https://raw.githubusercontent.com/aqeelshamz/quran/main/images/1.png)

```dart
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Quran Demo"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Juz Number: \n" + quran.getJuzNumber(18, 1).toString()),
              Text("\nJuz URL: \n" + quran.getJuzURL(15)),
              Text("\nSurah and Verses in Juz 15: \n" + quran.getSurahAndVersesFromJuz(15).toString()),
              Text("\nSurah Name: \n" + quran.getSurahName(18)),
              Text("\nSurah Name (English): \n" + quran.getSurahNameEnglish(18)),
              Text("\nSurah URL: \n" + quran.getSurahURL(18)),
              Text("\nTotal Verses: \n" + quran.getVerseCount(18).toString()),
              Text("\nPlace of Revelation: \n" + quran.getPlaceOfRevelation(18)),
              Text("\nBasmala: \n" + quran.getBasmala()),
              Text("\nVerse 1: \n" + quran.getVerse(18, 1))
            ],
          ),
        ),
      ),
    ),
  ));
}
```

![example2](https://raw.githubusercontent.com/aqeelshamz/quran/main/images/2.png)

```dart
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(quran.getSurahName(18)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: quran.getVerseCount(18),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    quran.getVerse(18, index + 1, verseEndSymbol: true),
                    textAlign: TextAlign.right,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
```
[<img width="250px" alt="BuyMeACoffee" src="https://raw.githubusercontent.com/aqeelshamz/projects-src/main/buymeacoffee.png" />][buymeacoffee]
[buymeacoffee]: https://www.buymeacoffee.com/aqeelshamz
