import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicely_app1/gen/assets.gen.dart';

class ChatBadgeIcon extends StatelessWidget {
  const ChatBadgeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(Assets.images.chatIcon),
      ),
    );
  }
}
