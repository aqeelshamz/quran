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
            Text("English title: ${getSurahNameEnglish(1)}"),
            Text("Aya: ${getAyaCount(1)}"),
            Text("Place of Revelation: ${getPlaceOfRevelation(1)}"),
            Text("Verses: "),
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