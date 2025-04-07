import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: GoogleFonts.poppins(
        fontSize: 50,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
