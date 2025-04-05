import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back!',
          style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Text(
          'Enter your Credentials to access your admin',
          style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
