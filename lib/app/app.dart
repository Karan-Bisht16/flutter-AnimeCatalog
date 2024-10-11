import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animecatalog/views/home.view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Journey",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF020412),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                "My Anime Catalog",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Because my opinion on fictional characters is vital!",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF020412),
        ),
        body: const Home(),
      ),
    );
  }
}
