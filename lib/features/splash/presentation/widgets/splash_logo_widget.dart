import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:servicely_app1/core/utils/assets.gen.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            Assets.images.splash1,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.contain,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            Assets.images.splash2,
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}
