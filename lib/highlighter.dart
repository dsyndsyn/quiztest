import 'package:flutter/material.dart';
import 'slice.dart';

// Class to represent each highlight segment
class HighlightSegment {
  final String text;
  final Color color;

  HighlightSegment({required this.text, required this.color});
}

class AyahHighlighter {
  List<Map<String, dynamic>>? ayats;
  List<List<List<HighlightSegment>>> ayahHighlights = [];

  AyahHighlighter({required this.ayats}) {
    generateAyahHighlights();
  }

  void generateAyahHighlights() {
    if (ayats == null) return;

    // Clear previous highlights
    ayahHighlights.clear();

    // Generate slices using AyahSlicer class
    ayahHighlights = AyahSlicer.generateSlices(ayats!);
  }

  int getNumberOfSlices(int ayahIndex) {
    if (ayahIndex >= 0 && ayahIndex < ayahHighlights.length) {
      return ayahHighlights[ayahIndex].length;
    }
    return 0;
  }

  // Function to highlight specific parts of the ayah text for the current slice
  TextSpan getCurrentSliceTextSpan(int ayahIndex, int sliceIndex) {
    if (ayahIndex >= 0 &&
        ayahIndex < ayahHighlights.length &&
        sliceIndex >= 0 &&
        sliceIndex < ayahHighlights[ayahIndex].length) {
      List<HighlightSegment> segments = ayahHighlights[ayahIndex][sliceIndex];
      String ayahText = ayats![ayahIndex]['text1'] ?? 'No text';
      return highlightAyah(ayahText, segments);
    }
    return const TextSpan(text: '');
  }

  // Function to highlight specific parts of the ayah text
  TextSpan highlightAyah(String text, List<HighlightSegment> segmentsToHighlight) {
    List<TextSpan> spans = [];

    for (var segment in segmentsToHighlight) {
      String part = segment.text;
      Color color = segment.color;

      int startIndex = text.indexOf(part);
      while (startIndex != -1) {
        spans.add(
          TextSpan(
            text: text.substring(0, startIndex),
            style: const TextStyle(
              fontFamily: "MeQuran2",
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        );
        spans.add(
          TextSpan(
            text: part,
            style: TextStyle(
              fontFamily: "MeQuran2",
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        text = text.substring(startIndex + part.length);
        startIndex = text.indexOf(part);
      }
    }

    // Add remaining text after the last highlighted part
    if (text.isNotEmpty) {
      spans.add(
        TextSpan(
          text: text,
          style: const TextStyle(
            fontFamily: "MeQuran2",
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      );
    }

    return TextSpan(children: spans);
  }
}
