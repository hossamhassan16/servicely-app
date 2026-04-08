import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "من فضلك أدخل رقم الجوال";
        }
        return null;
      },
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: 'رقم الجوال',
        hintStyle: TextStyle(color: secondaryColorHex),
        suffixIcon: const Icon(
          Icons.phone_in_talk,
          color: secondaryColorHex,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff818181),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
