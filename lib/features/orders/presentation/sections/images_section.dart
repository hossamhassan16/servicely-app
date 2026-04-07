import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("صور الخدمة", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            separatorBuilder: (_, __) => SizedBox(width: 8),
            itemBuilder: (context, index) {
              return SvgPicture.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/02/SVG_logo.svg",
                height: 60,
                width: 60,
              );
            },
          ),
        )
      ],
    );
  }
}
