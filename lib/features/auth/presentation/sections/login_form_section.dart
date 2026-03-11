import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/outlined_register_button.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/primary_button.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      context.go(
        RouterNames.OTP,
        extra: phoneController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              PhoneInputField(controller: phoneController),
              const SizedBox(height: 32),
              PrimaryButton(
                text: 'تسجيل الدخول',
                color: const Color(0xff0271F7),
                textColor: Colors.white,
                onPressed: _login,
              ),
              const SizedBox(height: 220),
              const Text(
                'ليس لديك حساب؟ ',
                style: TextStyle(color: Color(0xFF818181)),
              ),
              const SizedBox(height: 16),
              const OutlinedRegisterButton(
                borderColor: Color(0xFF818181),
                textColor: Color(0xFF818181),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
