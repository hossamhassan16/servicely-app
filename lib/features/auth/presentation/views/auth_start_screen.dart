import 'package:flutter/material.dart';
import 'package:servicely_app1/features/auth/presentation/sections/auth_start_body_section.dart';

class AuthStartScreen extends StatelessWidget {
  const AuthStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0271F7),
      body: AuthStartBodySection(),
    );
  }
}
