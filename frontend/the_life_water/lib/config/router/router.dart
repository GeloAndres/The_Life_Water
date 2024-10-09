import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/presentation/screen/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const AdminScreen()),
    GoRoute(
      path: '/router',
      builder: (BuildContext context, GoRouterState state) =>
          const RouterScreen(),
    )
  ],
);
