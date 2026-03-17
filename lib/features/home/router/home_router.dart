import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/features/home/presentation/views/home_screen.dart';

class HomeRouter {
  static final List<GoRoute> routes = [
    GoRoute(
      path: RouterNames.homeScreen,
      builder: (context, state) => HomeScreen(),
    ),
  ];
}
