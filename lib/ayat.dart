import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'highlighter.dart';

class AyatScreen extends StatefulWidget {
  const AyatScreen({super.key}); // Define constructor with key

  @override
  AyatScreenState createState() => AyatScreenState();
}

class AyatScreenState extends State<AyatScreen> {
  List<Map<String, dynamic>>? ayats;
  bool isLoading = false;
  int currentIndex = 0;
  int currentSliceIndex = 0; // Track current slice index
  int numberOfAyahsToShow = 7; // Adjust number of ayahs to display

  // Instance of AyahHighlighter class to manage highlights
  late AyahHighlighter ayahHighlighter;

  @override
  void initState() {
    super.initState();
    loadJson(numberOfAyahsToShow); // Load initial number of ayahs
  }

  Future<void> loadJson(int numberOfAyahs) async {
    setState(() {
      isLoading = true;
    });

    try {
      String jsonString =
      await rootBundle.loadString('assets/data/quran_texts-alfatihah.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      ayats = jsonMap['data'].values.toList().cast<Map<String, dynamic>>();

      // Sort the ayats by the 'aya' number
      ayats?.sort((a, b) => int.parse(a['aya']).compareTo(int.parse(b['aya'])));

      // Clean up text
      ayats?.forEach((ayat) {
        ayat['text1'] = ayat['text1']?.replaceAll('b', '') ?? '';
      });

      // Initialize AyahHighlighter with the list of ayats
      ayahHighlighter = AyahHighlighter(ayats: ayats!);
    } catch (e) {
      debugPrint('Failed to load Ayat: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  void showNextAya() {
    if (currentIndex < (ayats?.length ?? 0) - 1) {
      setState(() {
        currentIndex++;
        currentSliceIndex = 0; // Reset slice index when changing ayah
      });
    }
  }

  void showPreviousAya() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        currentSliceIndex = 0; // Reset slice index when changing ayah
      });
    }
  }

  void nextSlice() {
    if (currentSliceIndex < ayahHighlighter.getNumberOfSlices(currentIndex) - 1) {
      setState(() {
        currentSliceIndex++;
      });
    }
  }

  void previousSlice() {
    if (currentSliceIndex > 0) {
      setState(() {
        currentSliceIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah Al-Fatihah'),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ayats == null || ayats!.isEmpty
            ? const Text('Failed to load Ayat')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              text: ayahHighlighter.getCurrentSliceTextSpan(
                currentIndex,
                currentSliceIndex,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentSliceIndex > 0)
                  ElevatedButton(
                    onPressed: previousSlice,
                    child: const Text(
                      'Previous Slice',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                const SizedBox(width: 8),
                if (currentSliceIndex <
                    ayahHighlighter.getNumberOfSlices(currentIndex) -
                        1)
                  ElevatedButton(
                    onPressed: nextSlice,
                    child: const Text(
                      'Next Slice',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIndex > 0)
                  ElevatedButton(
                    onPressed: showPreviousAya,
                    child: const Text(
                      '< Back',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                const SizedBox(width: 8),
                if (currentIndex < (ayats?.length ?? 0) - 1)
                  ElevatedButton(
                    onPressed: showNextAya,
                    child: const Text(
                      'Next >',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
