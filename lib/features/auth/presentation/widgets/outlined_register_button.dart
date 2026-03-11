import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';

class OutlinedRegisterButton extends StatelessWidget {
  final Color borderColor;
  final Color textColor;
  const OutlinedRegisterButton({
    super.key,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => context.go(RouterNames.register),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text('إنشاء حساب', style: TextStyle(color: textColor)),
    );
  }
}
