import 'package:flutter/material.dart';
import 'package:servicely_app1/core/routing/app_router.dart';

void main() {
  runApp(const Servicely());
}

class Servicely extends StatelessWidget {
  const Servicely({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
