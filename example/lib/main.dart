import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

void main() {
  runApp(const MaterialApp(home: QuranExample()));
}

class QuranExample extends StatefulWidget {
  const QuranExample({super.key});

  @override
  State<QuranExample> createState() => _QuranExampleState();
}

class _QuranExampleState extends State<QuranExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran Demo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Juz Number: \n${quran.getJuzNumber(18, 1)}"),
              Text("\nJuz URL: \n${quran.getJuzURL(15)}"),
              Text(
                  "\nSurah and Verses in Juz 15: \n${quran.getSurahAndVersesFromJuz(15)}"),
              Text("\nSurah Name: \n${quran.getSurahName(18)}"),
              Text(
                  "\nSurah Name (English): \n${quran.getSurahNameEnglish(18)}"),
              Text("\nSurah URL: \n${quran.getSurahURL(18)}"),
              Text("\nTotal Verses: \n${quran.getVerseCount(18)}"),
              Text(
                  "\nPlace of Revelation: \n${quran.getPlaceOfRevelation(18)}"),
              Text("\nBasmala: \n${quran.basmala}",
                  style: GoogleFonts.amiriQuran()),
              Text(
                "\nVerse 1: \n${quran.getVerse(18, 1)}",
                style: GoogleFonts.amiriQuran(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
