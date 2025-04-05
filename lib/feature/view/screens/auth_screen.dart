import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/home_screen.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasData) {
      // User is signed in
      return HomeScreen(); // or Dashboard
    } else {
      // Not signed in
      return LoginScreen();
    }
  },
);
  }
}