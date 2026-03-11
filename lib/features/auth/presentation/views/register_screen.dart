import 'package:flutter/material.dart';
import 'package:servicely_app1/features/auth/presentation/sections/register_form_section.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_body_curve_container.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AuthBodyCurveContainer(
            child: Padding(
              padding: EdgeInsets.only(top: 120, right: 16, left: 16),
              child: AuthHeader(
                title: 'إنشاء حساب جديد',
                subtitle: 'من فضلك قم بإدخال بياناتك لإنشاء حساب جديد',
              ),
            ),
          ),
          // White area with login form
          Expanded(
            child: Container(
              color: Colors.white,
              child: const RegisterFormSection(),
            ),
          ),
        ],
      ),
    );
  }
}
