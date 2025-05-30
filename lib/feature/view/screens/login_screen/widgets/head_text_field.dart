import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingTextField extends StatelessWidget {
  final String hint;
  final String headline;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? obsecureText;
  const HeadingTextField({
    super.key,
    required this.headline,
    required this.controller,
    required this.hint,
    this.validator,
    this.readOnly, this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          obscureText: obsecureText?? false,
          readOnly: readOnly ?? false,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
