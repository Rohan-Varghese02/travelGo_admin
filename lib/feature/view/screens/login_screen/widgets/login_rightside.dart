import 'package:flutter/material.dart';

class LoginRightside extends StatelessWidget {
  const LoginRightside({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(25),
          bottomStart: Radius.circular(25),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://res.cloudinary.com/dvmrt0wfv/image/upload/v1743835965/logo2_t12tgn.png",
          ),
        ),
      ),
    );
  }
}
