import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        textAlign: TextAlign.right, // Aligns text to the right
        textDirection: TextDirection.rtl, // Sets RTL behavior
        maxLines: 5, // Allows for a taller box like the one in the image
        decoration: InputDecoration(
          hintText: 'تقييم الخدمة',
          hintStyle: TextStyle(
            color: secondaryColorHex,
            fontSize: 16,
          ),
          // The border when the field is NOT focused
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          // The border when the user clicks on the field
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: secondaryColorHex,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
