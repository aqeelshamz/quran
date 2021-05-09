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
                itemCount: quran.getAyaCount(1),
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