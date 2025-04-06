import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({super.key, this.onPressed, required this.header});
  final void Function()? onPressed;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: GoogleFonts.poppins(
            fontSize: 48,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
        IconButton(onPressed: onPressed, icon: Icon(Icons.add)),
      ],
    );
  }
}
