import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelgo_admin/feature/logic/admin/admin_bloc.dart';
import 'package:travelgo_admin/feature/logic/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/dashboard/dashboard_bloc.dart';
import 'package:travelgo_admin/feature/view/widgets/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDFEGMFxGhFDvZv9wypoiQppfWpkAdYpxw",
        authDomain: "travlgo-248ea.firebaseapp.com",
        appId: "1:139498252141:web:a2412621730cf2a3dc5c64",
        messagingSenderId: "139498252141",
        projectId: "travlgo-248ea",
      ),
    );
    log("Firebase initialized!");
  } catch (e) {
    log("Firebase failed to initialize: $e");
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AdminBloc()),
        BlocProvider(create: (context) => DashboardBloc()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthScreen());
  }
}
