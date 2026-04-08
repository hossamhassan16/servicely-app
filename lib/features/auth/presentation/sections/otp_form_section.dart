import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
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
  late List<TextEditingController> _otpInputControllers;
  late List<FocusNode> _otpFocusNodes;

  @override
  void initState() {
    super.initState();
    _generateOtp();
    _initializeOtpControllers();
  }

  void _initializeOtpControllers() {
    _otpInputControllers = List.generate(4, (index) => TextEditingController());
    _otpFocusNodes = List.generate(4, (index) => FocusNode());
    for (int i = 0; i < 4; i++) {
      _otpInputControllers[i].addListener(() {
        if (_otpInputControllers[i].text.length == 1 && i < 3) {
          _otpFocusNodes[i + 1].requestFocus();
        }
        _updateMainController();
      });
    }
  }

  void _updateMainController() {
    String otp = _otpInputControllers.map((c) => c.text).join();
    _otpController.text = otp;
  }

  void _generateOtp() {
    final random = Random();
    _generatedOtp = (1000 + random.nextInt(9000)).toString();
    print('Generated OTP: $_generatedOtp');
  }

  void _verifyOtp() {
    if (_otpController.text == _generatedOtp) {
      context.go(
        RouterNames.homeScreen,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _otpInputControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    _otpController.dispose();
    super.dispose();
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
            OtpInputRow(
              controllers: _otpInputControllers,
              focusNodes: _otpFocusNodes,
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: "تحقق",
              onPressed: _verifyOtp,
              color: primaryColorHex,
              textColor: Colors.white,
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
                      color: primaryColorHex,
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
                  style: const TextStyle(color: secondaryColorHex),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
