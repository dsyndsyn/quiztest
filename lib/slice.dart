import 'package:flutter/material.dart';
import 'highlighter.dart'; // Import the HighlightSegment class

class AyahSlicer {
  static List<List<List<HighlightSegment>>> generateSlices(List<Map<String, dynamic>> ayats) {
    List<List<List<HighlightSegment>>> ayahSlices = [];

    if (ayats.isEmpty) return ayahSlices;

    for (var ayah in ayats) {
      List<List<HighlightSegment>> slices = [];

      //aya 1 ------------------------------------------------
      if (ayah['aya'] == '1') {
        slices.add([
          HighlightSegment(text: 'بِسْمِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱللَّهِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلرَّحْمَـٰنِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلرَّحِيمِ', color: Colors.blue),
        ]);

        //aya 2 ------------------------------------------------
      } else if (ayah['aya'] == '2') {
        slices.add([
          HighlightSegment(text: 'ٱلْحَمْدُ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'لِلَّهِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'رَبِّ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلْعَـٰلَمِينَ', color: Colors.blue),
        ]);

        //aya 3 ------------------------------------------------
      } else if (ayah['aya'] == '3') {
        slices.add([
          HighlightSegment(text: 'ٱلرَّحْمَـٰنِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلرَّحِيمِ', color: Colors.blue),
        ]);

        //aya 4 ------------------------------------------------
      } else if (ayah['aya'] == '4') {
        slices.add([
          HighlightSegment(text: 'مَـٰلِكِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'يَوْمِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلدِّينِ', color: Colors.blue),
        ]);

        //aya 5 ------------------------------------------------
      } else if (ayah['aya'] == '5') {
        slices.add([
          HighlightSegment(text: 'إِيَّاكَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'نَعْبُدُ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'وَإِيَّاكَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'نَسْتَعِينُ', color: Colors.blue),
        ]);

        //aya 6 ------------------------------------------------
      } else if (ayah['aya'] == '6') {
        slices.add([
          HighlightSegment(text: 'ٱهْدِنَا', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلصِّرَ ٰط', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلْمُسْتَقِيمَ', color: Colors.blue),
        ]);

        //aya 7 ------------------------------------------------
      } else if (ayah['aya'] == '7') {
        slices.add([
          HighlightSegment(text: 'صِرَ ٰط', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلَّذِينَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'أَنْعَمْتَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'عَلَيْهِم', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'غَيْرِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلْمَغْضُوبِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'عَلَيْهِمْ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'وَلَا', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلضَّآلِّينَ', color: Colors.blue),
        ]);
      }

      ayahSlices.add(slices);
    }

    return ayahSlices;
  }
}
