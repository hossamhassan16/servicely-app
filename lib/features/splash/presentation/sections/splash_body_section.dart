import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/features/splash/presentation/widgets/splash_logo_widget.dart';
import 'package:servicely_app1/features/splash/router/splash_router_names.dart';

class SplashBodySection extends StatefulWidget {
  const SplashBodySection({super.key});

  @override
  State<SplashBodySection> createState() => _SplashBodySectionState();
}

class _SplashBodySectionState extends State<SplashBodySection> {
  @override
  void initState() {
    super.initState();
    _StartDelay();
  }

  void _StartDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigate();
  }

  void _navigate() {
    bool isFirstTime = true; // temporarily to test splash screen
    if (isFirstTime) {
      context.go(SplashRouterNames.onboarding);
    }

    // else {
    //   context.go(SplashRouterNames.home);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SplashLogoWidget(),
      ),
    );
  }
}
