import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PendingButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onPressed;
  const PendingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.all(15),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w400),
      ),
    );
  }
}
