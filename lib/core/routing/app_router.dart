import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicely_app1/features/splash/router/splash_router.dart';
import 'package:servicely_app1/features/splash/router/splash_router_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: SplashRouterNames.splash,
  routes: [
    ...SplashRouter.routes,
    GoRoute(
      path: SplashRouterNames.onboarding,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Onboarding Screen Placeholder')),
      ),
    ),
    GoRoute(
      path: SplashRouterNames.home,
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home Screen Placeholder')),
      ),
    ),
  ],
);
