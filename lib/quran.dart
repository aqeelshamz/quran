library quran;

import 'dart:math';

import 'package:quran/translations/en_clearquran.dart';
import 'package:quran/translations/en_saheeh.dart';
import 'package:quran/translations/ru_kuliev.dart';
import 'package:quran/translations/tr_saheeh.dart';
import 'package:quran/translations/ml_abdulhameed.dart';
import 'package:quran/translations/fr_hamidullah.dart';
import 'package:quran/translations/fa_husseindari.dart';
import 'package:quran/translations/it_piccardo.dart';
import 'package:quran/translations/nl_siregar.dart';
import 'package:quran/translations/pt.dart';

import 'juz_data.dart';
import 'page_data.dart';
import 'quran_text.dart';
import 'sajdah_verses.dart';
import 'surah_data.dart';

///Takes [pageNumber] and returns a list containing Surahs and the starting and ending Verse numbers in that page
///
///Example:
///
///```dart
///getPageData(604);
///```
///
/// Returns List of Page 604:
///
///```dart
/// [{surah: 112, start: 1, end: 5}, {surah: 113, start: 1, end: 4}, {surah: 114, start: 1, end: 5}]
///```
///
///Length of the list is the number of surah in that page.
List getPageData(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    throw "Invalid page number. Page number must be between 1 and 604";
  }
  return pageData[pageNumber - 1];
}

///The most standard and common copy of Arabic only Quran total pages count
const int totalPagesCount = 604;

///The constant total of makki surahs
const int totalMakkiSurahs = 89;

///The constant total of madani surahs
const int totalMadaniSurahs = 25;

///The constant total juz count
const int totalJuzCount = 30;

///The constant total surah count
const int totalSurahCount = 114;

///The constant total verse count
const int totalVerseCount = 6236;

///The constant 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'
const String basmala = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";

///The constant 'سَجْدَةٌ'
const String sajdah = "سَجْدَةٌ";

///Takes [pageNumber] and returns total surahs count in that page
int getSurahCountByPage(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    throw "Invalid page number. Page number must be between 1 and 604";
  }
  return pageData[pageNumber - 1].length;
}

///Takes [pageNumber] and returns total verses count in that page
int getVerseCountByPage(int pageNumber) {
  if (pageNumber < 1 || pageNumber > 604) {
    throw "Invalid page number. Page number must be between 1 and 604";
  }
  int totalVerseCount = 0;
  for (int i = 0; i < pageData[pageNumber - 1].length; i++) {
    totalVerseCount +=
        int.parse(pageData[pageNumber - 1][i]!["end"].toString());
  }
  return totalVerseCount;
}

///Takes [surahNumber] & [verseNumber] and returns Juz number
int getJuzNumber(int surahNumber, int verseNumber) {
  for (var juz in juz) {
    if (juz["verses"].keys.contains(surahNumber)) {
      if (verseNumber >= juz["verses"][surahNumber][0] &&
          verseNumber <= juz["verses"][surahNumber][1]) {
        return int.parse(juz["id"].toString());
      }
    }
  }
  return -1;
}

///Takes [juzNumber] and returns a map which contains keys as surah number and value as a list containing starting and ending verse numbers.
///
///Example:
///
///```dart
///getSurahAndVersesListFromJuz(1);
///```
///
/// Returns Map of Juz 1:
///
///```dart
/// Map<int, List<int>> surahAndVerses = {
///        1: [1, 7],
///        2: [1, 141] //2 is surahNumber, 1 is starting verse and 141 is ending verse number
/// };
///
/// print(surahAndVerseList[1]); //[1, 7] => starting verse : 1, ending verse: 7
///```
Map<int, List<int>> getSurahAndVersesFromJuz(int juzNumber) {
  return juz[juzNumber - 1]["verses"];
}

///Takes [surahNumber] and returns the Surah name
String getSurahName(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['name'].toString();
}

///Takes [surahNumber] returns the Surah name in English
String getSurahNameEnglish(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['english'].toString();
}

///Takes [surahNumber] returns the Surah name in Turkish
String getSurahNameTurkish(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['turkish'].toString();
}

///Takes [surahNumber] returns the Surah name in French
String getSurahNameFrench(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['french'].toString();
}

///Takes [surahNumber] returns the Surah name in Arabic
String getSurahNameArabic(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['arabic'].toString();
}

///Takes [surahNumber] returns the Surah name in Russian
String getSurahNameRussian(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['russian'].toString();
}

///Takes [surahNumber], [verseNumber] and returns the page number of the Quran
int getPageNumber(int surahNumber, int verseNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }

  for (int pageIndex = 0; pageIndex < pageData.length; pageIndex++) {
    for (int surahIndexInPage = 0;
        surahIndexInPage < pageData[pageIndex].length;
        surahIndexInPage++) {
      final e = pageData[pageIndex][surahIndexInPage];
      if (e['surah'] == surahNumber &&
          e['start'] <= verseNumber &&
          e['end'] >= verseNumber) {
        return pageIndex + 1;
      }
    }
  }

  throw "Invalid verse number.";
}

///Takes [surahNumber] and returns the place of revelation (Makkah / Madinah) of the surah
String getPlaceOfRevelation(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No Surah found with given surahNumber";
  }
  return surah[surahNumber - 1]['place'].toString();
}

///Takes [surahNumber] and returns the count of total Verses in the Surah
int getVerseCount(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "No verse found with given surahNumber";
  }
  return int.parse(surah[surahNumber - 1]['aya'].toString());
}

///Takes [surahNumber], [verseNumber] & [verseEndSymbol] (optional) and returns the Verse in Arabic
String getVerse(int surahNumber, int verseNumber,
    {bool verseEndSymbol = false}) {
  String verse = "";
  for (var i in quranText) {
    if (i['surah_number'] == surahNumber && i['verse_number'] == verseNumber) {
      verse = i['content'].toString();
      break;
    }
  }

  if (verse == "") {
    throw "No verse found with given surahNumber and verseNumber.\n\n";
  }

  return verse + (verseEndSymbol ? getVerseEndSymbol(verseNumber) : "");
}

///Takes [juzNumber] and returns Juz URL (from Quran.com)
String getJuzURL(int juzNumber) {
  return "https://quran.com/juz/$juzNumber";
}

///Takes [surahNumber] and returns Surah URL (from Quran.com)
String getSurahURL(int surahNumber) {
  return "https://quran.com/$surahNumber";
}

///Takes [surahNumber] & [verseNumber] and returns Verse URL (from Quran.com)
String getVerseURL(int surahNumber, int verseNumber) {
  return "https://quran.com/$surahNumber/$verseNumber";
}

///Takes [verseNumber], [arabicNumeral] (optional) and returns '۝' symbol with verse number
String getVerseEndSymbol(int verseNumber, {bool arabicNumeral = true}) {
  var arabicNumeric = '';
  var digits = verseNumber.toString().split("").toList();

  if (!arabicNumeral) return '\u06dd${verseNumber.toString()}';

  const Map arabicNumbers = {
    "0": "٠",
    "1": "١",
    "2": "٢",
    "3": "٣",
    "4": "٤",
    "5": "٥",
    "6": "٦",
    "7": "٧",
    "8": "٨",
    "9": "٩",
  };

  for (var e in digits) {
    arabicNumeric += arabicNumbers[e];
  }

  return '\u06dd$arabicNumeric';
}

///Takes [surahNumber] and returns the list of page numbers of the surah
List<int> getSurahPages(int surahNumber) {
  if (surahNumber > 114 || surahNumber <= 0) {
    throw "Invalid surahNumber";
  }

  const pagesCount = totalPagesCount;
  List<int> pages = [];
  for (int currentPage = 1; currentPage <= pagesCount; currentPage++) {
    final pageData = getPageData(currentPage);
    for (int j = 0; j < pageData.length; j++) {
      final currentSurahNum = pageData[j]['surah'];
      if (currentSurahNum == surahNumber) {
        pages.add(currentPage);
        break;
      }
    }
  }
  return pages;
}

enum SurahSeperator {
  none,
  surahName,
  surahNameArabic,
  surahNameEnglish,
  surahNameTurkish,
  surahNameFrench,
  surahNameRussian,
}

///Takes [pageNumber], [verseEndSymbol], [surahSeperator] & [customSurahSeperator] and returns the list of verses in that page
///if [customSurahSeperator] is given, [surahSeperator] will not work.
List<String> getVersesTextByPage(int pageNumber,
    {bool verseEndSymbol = false,
    SurahSeperator surahSeperator = SurahSeperator.none,
    String customSurahSeperator = ""}) {
  if (pageNumber > 604 || pageNumber <= 0) {
    throw "Invalid pageNumber";
  }

  List<String> verses = [];
  final pageData = getPageData(pageNumber);
  for (var data in pageData) {
    if (customSurahSeperator != "") {
      verses.add(customSurahSeperator);
    } else if (surahSeperator == SurahSeperator.surahName) {
      verses.add(getSurahName(data["surah"]));
    } else if (surahSeperator == SurahSeperator.surahNameArabic) {
      verses.add(getSurahNameArabic(data["surah"]));
    } else if (surahSeperator == SurahSeperator.surahNameEnglish) {
      verses.add(getSurahNameEnglish(data["surah"]));
    } else if (surahSeperator == SurahSeperator.surahNameTurkish) {
      verses.add(getSurahNameTurkish(data["surah"]));
    } else if (surahSeperator == SurahSeperator.surahNameFrench) {
      verses.add(getSurahNameFrench(data["surah"]));
    } else if (surahSeperator == SurahSeperator.surahNameRussian) {
      verses.add(getSurahNameRussian(data["surah"]));
    }
    for (int j = data["start"]; j <= data["end"]; j++) {
      verses.add(getVerse(data["surah"], j, verseEndSymbol: verseEndSymbol));
    }
  }
  return verses;
}

///Takes [surahNumber] and returns audio URL of that surah
String getAudioURLBySurah(int surahNumber) {
  return "https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/$surahNumber.mp3";
}

///Takes [surahNumber] & [verseNumber] and returns audio URL of that verse
String getAudioURLByVerse(int surahNumber, int verseNumber) {
  int verseNum = 0;
  for (var i in quranText) {
    if (i['surah_number'] == surahNumber && i['verse_number'] == verseNumber) {
      verseNum = quranText.indexOf(i) + 1;
      break;
    }
  }
  return "https://cdn.islamic.network/quran/audio/128/ar.alafasy/$verseNum.mp3";
}

///Takes [surahNumber] & [verseNumber] and returns true if verse is sajdah
bool isSajdahVerse(int surahNumber, int verseNumber) =>
    sajdahVerses[surahNumber] == verseNumber;

///Takes [verseNumber] and returns audio URL of that verse
String getAudioURLByVerseNumber(int verseNumber) {
  return "https://cdn.islamic.network/quran/audio/128/ar.alafasy/$verseNumber.mp3";
}

enum Translation {
  enSaheeh,
  enClearQuran,
  trSaheeh,
  mlAbdulHameed,
  faHusseinDari,
  frHamidullah,
  itPiccardo,
  nlSiregar,
  pt,
  ruKuliev,
}

///Takes [surahNumber], [verseNumber], [verseEndSymbol] (optional) & [translation] (optional) and returns verse translation
String getVerseTranslation(int surahNumber, int verseNumber,
    {bool verseEndSymbol = false,
    Translation translation = Translation.enSaheeh}) {
  String verse = "";

  var translationText = enSaheeh;

  switch (translation) {
    case Translation.enSaheeh:
      translationText = enSaheeh;
      break;
    case Translation.enClearQuran:
      translationText = enClearQuran;
      break;
    case Translation.faHusseinDari:
      translationText = faHusseinDari;
      break;
    case Translation.itPiccardo:
      translationText = itPiccardo;
      break;
    case Translation.nlSiregar:
      translationText = nlSiregar;
      break;
    case Translation.pt:
      translationText = pt;
      break;
    case Translation.trSaheeh:
      translationText = trSaheeh;
      break;
    case Translation.mlAbdulHameed:
      translationText = mlAbdulHameed;
      break;
    case Translation.frHamidullah:
      translationText = frHamidullah;
      break;
    case Translation.ruKuliev:
      translationText = ruKuliev;
      break;
    default:
      translationText = enSaheeh;
  }

  for (var i in translationText) {
    if (i['surah_number'] == surahNumber && i['verse_number'] == verseNumber) {
      verse = i['content'].toString();
      break;
    }
  }

  if (verse == "") {
    throw "No verse found with given surahNumber and verseNumber.\n\n";
  }

  return verse +
      (verseEndSymbol
          ? getVerseEndSymbol(verseNumber, arabicNumeral: false)
          : "");
}

///Takes a list of words [words] and [translation] (optional) and returns a map containing no. of occurences and result of the word search in the traslation
Map searchWordsInTranslation(List<String> words,
    {Translation translation = Translation.enSaheeh}) {
  var translationText = enSaheeh;

  switch (translation) {
    case Translation.enSaheeh:
      translationText = enSaheeh;
      break;
    case Translation.enClearQuran:
      translationText = enClearQuran;
      break;
    case Translation.faHusseinDari:
      translationText = faHusseinDari;
      break;
    case Translation.itPiccardo:
      translationText = itPiccardo;
      break;
    case Translation.nlSiregar:
      translationText = nlSiregar;
      break;
    case Translation.pt:
      translationText = pt;
      break;
    case Translation.trSaheeh:
      translationText = trSaheeh;
      break;
    case Translation.mlAbdulHameed:
      translationText = mlAbdulHameed;
      break;
    case Translation.frHamidullah:
      translationText = frHamidullah;
      break;
    case Translation.ruKuliev:
      translationText = ruKuliev;
      break;
    default:
      translationText = enSaheeh;
  }

  List<Map> result = [];

  for (var i in translationText) {
    bool exist = false;
    for (var word in words) {
      if (i['content']
          .toString()
          .toLowerCase()
          .contains(word.toString().toLowerCase())) {
        exist = true;
      }
    }
    if (exist) {
      result.add({"surah": i["surah_number"], "verse": i["verse_number"]});
    }
  }

  return {"occurences": result.length, "result": result};
}

///Takes a list of words [words] and returns a map containing no. of occurences and result of the word search in the arabic quran text.
///
///You have to include the harakaat (diacritics) in the words
///
///Example:
///```dart
/// searchWords(["لِّلَّهِ","وَٱللَّهُ","ٱللَّهُ"])
///```
Map searchWords(List<String> words) {
  List<Map> result = [];

  for (var i in quranText) {
    bool exist = false;
    for (var word in words) {
      if (i['content']
          .toString()
          .toLowerCase()
          .contains(word.toString().toLowerCase())) {
        exist = true;
      }
    }
    if (exist) {
      result.add({"surah": i["surah_number"], "verse": i["verse_number"]});
    }
  }

  return {"occurences": result.length, "result": result};
}

class RandomVerse {
  late int surahNumber;
  late int verseNumber;
  late String verse;
  late String translation;

  RandomVerse() {
    final random = Random();
    surahNumber = random.nextInt(114) + 1;
    verseNumber = random.nextInt(getVerseCount(surahNumber)) + 1;
    verse = getVerse(surahNumber, verseNumber);
    translation = getVerseTranslation(surahNumber, verseNumber);
  }
}
