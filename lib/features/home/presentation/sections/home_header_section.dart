import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/features/home/presentation/widgets/chat_badge_icon.dart';
import 'package:servicely_app1/features/home/presentation/widgets/notification_badge_icon.dart';
import 'package:servicely_app1/features/home/presentation/widgets/user_avatar_name.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NotificationBadgeIcon(),
          const SizedBox(width: 10),
          ChatBadgeIcon(),
          Spacer(),
          UserAvatarName(textColor: Colors.white),
        ],
      ),
    );
  }
}
