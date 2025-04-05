import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'TravlGo Admin',
      style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}
