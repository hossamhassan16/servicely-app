import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';

class OtpInputRow extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;

  const OtpInputRow({
    super.key,
    required this.controllers,
    required this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(4, (index) {
        return Container(
          width: 55,
          height: 67,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF18B791)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              hintText: "__",
              hintStyle: TextStyle(
                fontSize: 24,
                color: secondaryColorHex,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: secondaryColorHex),
          ),
        );
      }),
    );
  }
}
