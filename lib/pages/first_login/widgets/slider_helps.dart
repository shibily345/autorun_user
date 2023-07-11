import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeSlide extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const WelcomeSlide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 200,
          ),
          SizedBox(height: 30),
          Text(
            title,
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
