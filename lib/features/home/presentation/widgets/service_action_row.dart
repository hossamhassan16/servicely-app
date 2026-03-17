import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            "assets/images/chat_3114553.svg",
            color: Colors.grey,
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
