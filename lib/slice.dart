import 'package:flutter/material.dart';
import 'highlighter.dart';

class AyahSlicer {
  // Static method to generate highlighted slices for Quranic verses
  static List<List<List<HighlightSegment>>> generateSlices(List<Map<String, dynamic>> ayats) {
    List<List<List<HighlightSegment>>> ayahSlices = [];

    if (ayats.isEmpty) return ayahSlices; // Return empty list if ayats is empty

    // Process each ayah in the ayats list
    for (var ayah in ayats) {
      List<List<HighlightSegment>> slices = [];

      // Determine highlight segments based on 'aya' number
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
      } else if (ayah['aya'] == '3') {
        slices.add([
          HighlightSegment(text: 'ٱلرَّحْمَـٰنِ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلرَّحِيمِ', color: Colors.blue),
        ]);
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
      } else if (ayah['aya'] == '6') {
        slices.add([
          HighlightSegment(text: 'ٱهْدِنَا', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلصِّرَ ٰطَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلْمُسْتَقِيمَ', color: Colors.blue),
        ]);
      } else if (ayah['aya'] == '7') {
        slices.add([
          HighlightSegment(text: 'صِرَ ٰط', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'ٱلَّذِينَ', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'أَنْعَمْت', color: Colors.blue),
        ]);
        slices.add([
          HighlightSegment(text: 'عَلَيْهِمْ', color: Colors.blue),
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

      ayahSlices.add(slices); // Add slices for current ayah to ayahSlices
    }

    return ayahSlices;
  }
}
