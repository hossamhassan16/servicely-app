import 'package:flutter/material.dart';
import 'package:servicely_app1/features/auth/presentation/sections/otp_form_section.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_body_curve_container.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/auth_header.dart';

class OtpScreen extends StatelessWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AuthBodyCurveContainer(
            child: Padding(
              padding: EdgeInsets.only(top: 120, right: 16, left: 16),
              child: AuthHeader(
                title: 'كود التحقق',
                subtitle:
                    'من فضلك قم بإدخال كود التحقق الذى تم إرسالة على رقم $phone',
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: const OtpFormSection(),
            ),
          ),
        ],
      ),
    );
  }
}
