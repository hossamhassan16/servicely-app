import 'package:go_router/go_router.dart';
import 'package:servicely_app1/core/routing/router_names.dart';
import 'package:servicely_app1/features/auth/presentation/views/auth_start_screen.dart';
import 'package:servicely_app1/features/auth/presentation/views/login_screen.dart';
import 'package:servicely_app1/features/auth/presentation/views/otp_screen.dart';
import 'package:servicely_app1/features/auth/presentation/views/register_screen.dart';

class AuthRouter {
  static final List<GoRoute> routes = [
    GoRoute(
      path: RouterNames.authStart,
      builder: (context, state) => AuthStartScreen(),
    ),
    GoRoute(
      path: RouterNames.login,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: RouterNames.OTP,
      builder: (context, state) {
        final phone = state.extra as String;
        return OtpScreen(phone: phone);
      },
    ),
    GoRoute(
      path: RouterNames.register,
      builder: (context, state) => RegisterScreen(),
    ),
  ];
}
