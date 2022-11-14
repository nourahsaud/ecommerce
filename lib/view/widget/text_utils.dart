import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUlits extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underLine;
  const TextUlits(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.underLine,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration: underLine,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
