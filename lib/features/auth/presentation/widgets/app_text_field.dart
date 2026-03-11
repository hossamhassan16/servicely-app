import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  final String hintText;
  const NameInputField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "من فضلك أدخل الاسم";
        }
        return null;
      },
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff818181)),
        suffixIcon: const Icon(
          Icons.person,
          color: Color(0xffC5C5C5),
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
