import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserAvatarName extends StatelessWidget {
  const UserAvatarName({super.key});

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
              const Text(
                'محمود عبد الله',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SvgPicture.asset(
                "assets/images/Servicely Logo Horizontal 2.svg",
                height: 45,
                width: 45,
              )
            ],
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
