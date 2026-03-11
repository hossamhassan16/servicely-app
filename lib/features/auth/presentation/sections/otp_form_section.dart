import 'dart:math';
import 'package:flutter/material.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/otp_input_row.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/primary_button.dart';

class OtpFormSection extends StatefulWidget {
  const OtpFormSection({super.key});

  @override
  State<OtpFormSection> createState() => _OtpFormSectionState();
}

class _OtpFormSectionState extends State<OtpFormSection> {
  late String _generatedOtp;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateOtp();
  }

  void _generateOtp() {
    final random = Random();
    _generatedOtp = (1000 + random.nextInt(9000)).toString();
    print('Generated OTP: $_generatedOtp');
  }

  void _verifyOtp() {
    if (_otpController.text == _generatedOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified successfully!')),
      );
    } else {
      // OTP is incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Generated OTP: $_generatedOtp',
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            OtpInputRow(controller: _otpController),
            const SizedBox(height: 32),
            PrimaryButton(
              text: "تحقق",
              onPressed: _verifyOtp,
              color: const Color(0xFF0271F7),
              textColor: const Color(0xFFFFFFFF),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    textDirection: TextDirection.rtl,
                    " إعادة إرسالة فى 60 ثانية",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _generateOtp();
                    });
                  },
                ),
                Text(
                  textDirection: TextDirection.rtl,
                  "لم يتم إرسال الكود  ؟ ",
                  style: const TextStyle(color: Color(0xFF818181)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
