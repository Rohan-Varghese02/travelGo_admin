import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/view/screens/home_screen/home_screen.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return FutureBuilder<bool>(
            future: checkIfAdmin(snapshot.data!.uid),
            builder: (context, adminSnapshot) {
              if (adminSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (adminSnapshot.data == true) {
                return HomeScreen();
              } else {
                FirebaseAuth.instance.signOut();
                return LoginScreen();
              }
            },
          );
        }
        return LoginScreen();
      },
    ),
  );
}
}

Future<bool> checkIfAdmin(String uid) async {
  final doc = await FirebaseFirestore.instance.collection("Admin").doc(uid).get();
  return doc.exists;
}