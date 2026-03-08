import 'package:go_router/go_router.dart';
import 'package:servicely_app1/features/splash/presentation/views/splash_screen.dart';
import 'package:servicely_app1/features/splash/router/splash_router_names.dart';

class SplashRouter {
  static final List<RouteBase> routes = [
    GoRoute(
      path: SplashRouterNames.splash,
      name: SplashRouterNames.splash,
      builder: (context, state) => const SplashScreen(),
    ),
  ];
}
