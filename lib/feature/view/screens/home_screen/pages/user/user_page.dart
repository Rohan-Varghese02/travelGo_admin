import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/pages/user/widgets/user_list.dart';
import 'package:travelgo_admin/feature/view/widgets/header.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Header(header: 'Users'), Flexible(child: UserList())],
        ),
      ),
    );
  }
}
