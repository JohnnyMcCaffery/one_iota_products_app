import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteNavigation extends StatelessWidget {
  const RouteNavigation({
    required this.router,
    super.key,
  });

  final GoRouter router;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      );
}
