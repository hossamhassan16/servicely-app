import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationBadgeIcon extends StatelessWidget {
  const NotificationBadgeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
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
                child: SvgPicture.asset("assets/images/not icon.svg"),
              ),
            ),
            Positioned(
              bottom: -6,
              right: -6,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
