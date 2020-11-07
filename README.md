# quran

Full Quran text and Surah details

## Getting Started

To use this plugin, add `quran` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

**Functions:**

* **`getSurahName(int surahNumber)`** - Get Surah Name by surah number
* **`getAyaCount(int surahNumber)`** - Get Aya Count by surah number
* **`getVerse(int surahNumber, int verseNumber)`** - Get Verse (text) by surah number and verse number

## Example

```dart
import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Surah: ${getSurahName(1)}"),
            Text("Aya: ${getAyaCount(1)}"),
            Text("Verse 1: ${getVerse(1, 1)}")
          ],
        ),
      ),
    ),
  ));
}
```
