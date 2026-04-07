import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';

import 'package:servicely_app1/features/auth/router/auth_router.dart';
import 'package:servicely_app1/features/home/presentation/views/home_screen.dart';
import 'package:servicely_app1/features/home/presentation/views/request_service_screen.dart';
import 'package:servicely_app1/features/splash/router/splash_router.dart';
import 'package:servicely_app1/features/splash/router/splash_router_names.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: SplashRouterNames.splash,
  routes: [
    ...SplashRouter.routes,

    ...AuthRouter.routes,

    GoRoute(
      path: RouterNames.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
    // GoRoute(
    //   path: RouterNames.OrderDetail,
    //   builder: (context, state) =>
    //       OrderDetailScreen(order: state.extra as OrderItem),
    // ),
    GoRoute(
      name: RouterNames.requestService,
      path: RouterNames.requestService,
      builder: (context, state) {
        final args = state.extra as Map<String, String>?;
        return RequestServiceScreen(
          serviceName: args?['serviceName'] ?? '',
          providerName: args?['providerName'] ?? '',
        );
      },
    ),
  ],
);
