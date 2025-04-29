import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/promote/widgets/post_tiles.dart';
import 'package:travelgo_admin/feature/view/widgets/style_text.dart';

class PromotePage extends StatelessWidget {
  const PromotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                text: 'Promote Posts',
                size: 50,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
              PostTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
