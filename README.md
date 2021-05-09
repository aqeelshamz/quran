Full Quran text and Surah details

## Getting Started

To use this plugin, add `quran` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

**Functions:**

* **`getSurahName(int surahNumber)`** - Get Surah Name by surah number
* **`getSurahNameEnglish(int surahNumber)`** - Get Surah English Title by surah number
* **`getVerseCount(int surahNumber)`** - Get Aya Count by surah number
* **`getPlaceOfRevelation(int surahNumber)`** - Get Place of Revelation (Makkah / Madinah)
* **`getVerse(int surahNumber, int verseNumber)`** - Get Verse (text) by surah number and verse number
* **`getTotalVerseCount()`** - Get total aya count
* **`getTotalSurahCount()`** - Get total surah count
* **`getBasmala()`** - Get Basmala (بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ)
* **`getSurahURL(int surahNumber)`** - Get Surah URL (from Quran.com) by surah number
* **`getVerseURL(int surahNumber, int verseNumber)`** - Get Verse URL (from Quran.com) by surah number and verse number

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Surah: ${quran.getSurahName(1)}"),
            Text("English title: ${quran.getSurahNameEnglish(1)}"),
            Text("Aya: ${quran.getVerseCount(1)}"),
            Text("Place of Revelation: ${quran.getPlaceOfRevelation(1)}"),
            Text("Basmala: ${quran.getBasmala()}"),
            Text("Verse 1: ${quran.getVerse(1, 1)}"),
            Text("Surah URL: ${quran.getSurahURL(1)}"),
            Text("Verse URL: ${quran.getVerseURL(1, 1)}"),
          ],
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
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Quran Demo"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Surah: ${quran.getSurahName(1)}"),
            Text("English title: ${quran.getSurahNameEnglish(1)}"),
            Text("Aya: ${quran.getAyaCount(1)}"),
            Text("Place of Revelation: ${quran.getPlaceOfRevelation(1)}"),
            Text("Verses: "),
            Expanded(
              child: ListView.builder(
                itemCount: getAyaCount(1),
                itemBuilder: (context, index) {
                  return Text("${index+1}. ${quran.getVerse(1, index + 1)}");
                },
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
```
