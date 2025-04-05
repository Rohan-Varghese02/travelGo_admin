import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelgo_admin/feature/logic/auth/auth_bloc.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/widgets/head_text_field.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/widgets/login_btn.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/widgets/login_rightside.dart';
import 'package:travelgo_admin/feature/view/screens/login_screen/widgets/login_text.dart';
import 'package:travelgo_admin/feature/view/widgets/auth_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        log(state.runtimeType.toString());
        if (state is AuthException) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.code)));
        } else if (state is AuthSucess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthScreen()),
          );
        }
      },
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: width * 0.6,
              height: height,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: SizedBox(
                  width: width * 0.5,
                  height: height * 0.5,
                  child: SingleChildScrollView(
                    child: Form(
                      key: emailkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoginText(),
                          SizedBox(height: 20),
                          HeadingTextField(
                            headline: 'Email address',
                            controller: emailController,
                            hint: 'Enter your Email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your email";
                              } else if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          HeadingTextField(
                            headline: 'Password',
                            controller: passController,
                            hint: 'Enter your password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: LoginBtn(
                              width: width * 0.4,
                              height: height * 0.07,
                              onPressed: () {
                                if (emailkey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    LoginBtnPressed(
                                      email: emailController.text,
                                      password: passController.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LoginRightside(width: width, height: height),
          ],
        ),
      ),
    );
  }
}
