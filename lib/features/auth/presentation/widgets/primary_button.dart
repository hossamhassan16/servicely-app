import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: textColor),
        ),
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
