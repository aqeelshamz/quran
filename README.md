Full Quran text and Surah details

## Getting Started

To use this plugin, add `quran` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

**Functions:**

* **`getSurahName(int surahNumber)`** - Get Surah Name by surah number
* **`getAyaCount(int surahNumber)`** - Get Aya Count by surah number
* **`getVerse(int surahNumber, int verseNumber)`** - Get Verse (text) by surah number and verse number

## Example
![example](https://raw.githubusercontent.com/aqeelshamz/quran/main/images/1.png)

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

![example2](https://raw.githubusercontent.com/aqeelshamz/quran/main/images/1.png)

```dart
import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

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
            Text("Surah: ${getSurahName(1)}"),
            Text("Aya: ${getAyaCount(1)}"),
            Expanded(
              child: ListView.builder(
                itemCount: getAyaCount(1),
                itemBuilder: (context, index) {
                  return Text("${index+1}. ${getVerse(1, index + 1)}");
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
