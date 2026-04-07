import 'package:flutter/material.dart';

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
              child: Image.asset("assets/images/provider-chat.png"),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/stars.png",
                      width: 54,
                      height: 11,
                    ),
                    const Text("محمود عبد الله"),
                  ],
                ),
                Text(
                  "170",
                  style: TextStyle(color: Color(0xff18B791)),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
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
