import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizerText extends StatelessWidget {
  const OrganizerText({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(fontSize: size, fontWeight: FontWeight.w500),
    );
  }
}
