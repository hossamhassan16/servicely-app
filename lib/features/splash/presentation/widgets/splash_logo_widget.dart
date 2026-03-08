import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/images/splash1.svg',
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.contain,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            'assets/images/splash2.svg',
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }
}
