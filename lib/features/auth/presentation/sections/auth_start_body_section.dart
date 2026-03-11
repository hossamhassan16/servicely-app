import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/outlined_register_button.dart';
import 'package:servicely_app1/features/auth/presentation/widgets/primary_button.dart';

class AuthStartBodySection extends StatelessWidget {
  const AuthStartBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18,
        left: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Spacer(),
          Center(
              child: SvgPicture.asset(
                  "assets/images/Servicely Logo Horizontal 2.svg")),
          Spacer(),
          const Text(
            "مرحبــــــــــآ بك",
            // textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 6,
          ),
          const Text(
            'اختر الإجراء المناسب لتصفح التطبيق',
            // textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 32),
          // زر تسجيل الدخول (أبيض)
          PrimaryButton(
            text: 'تسجيل الدخول',
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () => context.go(RouterNames.login),
          ),
          const SizedBox(height: 16),
          const OutlinedRegisterButton(
              borderColor: Colors.white, textColor: Colors.white),
          Spacer(),
        ],
      ),
    );
  }
}
