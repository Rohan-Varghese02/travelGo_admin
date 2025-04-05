import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key, required this.width, required this.height, this.onPressed});
  final double width;
  final double height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(
        'Login',
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
