import 'package:flutter/material.dart';
import 'package:servicely_app1/core/theme/app_theme.dart';
import 'package:servicely_app1/gen/assets.gen.dart';

class ProviderSection extends StatelessWidget {
  const ProviderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.images.providerChat.image(),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.stars.image(width: 54, height: 11),
                    const Text("محمود عبد الله"),
                  ],
                ),
                Text(
                  "170",
                  style: TextStyle(color: secondaryColorHex),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: secondaryColorHex,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
