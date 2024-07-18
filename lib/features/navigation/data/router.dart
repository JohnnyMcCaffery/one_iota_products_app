import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_iota_products_app/pages/basket_page.dart';
import 'package:one_iota_products_app/pages/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: "/basket",
      builder: (BuildContext context, GoRouterState state) =>
          const BasketPage(),
    ),
  ],
);
