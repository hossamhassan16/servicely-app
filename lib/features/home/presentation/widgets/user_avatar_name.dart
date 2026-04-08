import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/core/utils/assets.gen.dart';

class UserAvatarName extends StatelessWidget {
  final Color textColor;
  const UserAvatarName({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 38,
              ),
              Text(
                'محمود عبد الله',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
              SvgPicture.asset(
                Assets.images.servicelyLogoHorizontal2,
                height: 45,
                width: 45,
              )
            ],
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: secondaryColorHex,
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
