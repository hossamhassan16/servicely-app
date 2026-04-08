import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/gen/assets.gen.dart';

class ServiceActionsRow extends StatelessWidget {
  final VoidCallback onDetails;

  const ServiceActionsRow({super.key, required this.onDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xffEAF6F3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            Assets.images.chat3114553,
            color: secondaryColorHex,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: onDetails,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0271F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "عرض التفاصيل",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
