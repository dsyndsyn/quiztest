import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AyatScreen extends StatefulWidget {
  @override
  _AyatScreenState createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  List<Map<String, dynamic>>? ayats;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    setState(() {
      isLoading = true;
    });

    try {
      String jsonString = await rootBundle.loadString('assets/data/quran_texts-alfatihah.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      ayats = jsonMap['data'].values.toList().cast<Map<String, dynamic>>();

      // Clean up text
      ayats?.forEach((ayat) {
        ayat['text1'] = ayat['text1']?.replaceAll('b', '') ?? '';
      });
    } catch (e) {
      print('Failed to load Ayat: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah Al-Fatihah'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the main screen
          },
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ayats == null
            ? Text('Failed to load Ayat')
            : ListView.builder(
          itemCount: ayats!.length,
          itemBuilder: (context, index) {
            var ayat = ayats![index];
            return ListTile(
              title: Center(
                child: Text(
                  ayat['text1'] ?? 'No text',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AyatScreen(),
  ));
}
