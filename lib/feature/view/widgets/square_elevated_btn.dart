import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class SquareElevatedBtn extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double radius;
  final Color? color;
  final Color? backgroundColor;
  const SquareElevatedBtn({
    super.key,
    required this.text,
    this.onPressed,
    required this.radius,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: StyleText(text: text, color: color),
    );
  }
}
