import 'package:flutter/material.dart';
import 'package:servicely_app1/features/auth/presentation/sections/login_form_section.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_body_curve_container.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Curved blue header with title
          const AuthBodyCurveContainer(
            child: Padding(
              padding: EdgeInsets.only(top: 120, right: 16, left: 16),
              child: AuthHeader(
                title: 'تسجيل الدخول',
                subtitle: 'من فضلك قم بإدخال بياناتك لتسجيل الدخول',
              ),
            ),
          ),
          // White area with login form
          Expanded(
            child: Container(
              color: Colors.white,
              child: const LoginFormSection(),
            ),
          ),
        ],
      ),
    );
  }
}
