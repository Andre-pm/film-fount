import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final bool isLargeScreen;
  final String title;
  final TextAlign? textAlign;
  final Color? color;

  const TitleText({
    super.key,
    required this.isLargeScreen,
    required this.title,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isLargeScreen ? 80 : 25,
        vertical: 25,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isLargeScreen ? 30 : 25,
          fontFamily: GoogleFonts.rammettoOne().fontFamily,
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).colorScheme.secondary,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
