import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_life_water/presentation/screen/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const AdminScreen(),
        routes: <RouteBase>[
          GoRoute(
            path: 'create-new-client',
            builder: (BuildContext context, GoRouterState state) =>
                const CreateNewClientScreen(),
          ),
          GoRoute(
            path: 'generation-info',
            builder: (BuildContext context, GoRouterState state) =>
                const GenerationInfoScreen(),
          ),
          GoRoute(
            path: 'create-new-product',
            builder: (BuildContext context, GoRouterState state) =>
                const CreateNewProductScreen(),
          ),
          GoRoute(
            path: 'watch-client',
            builder: (BuildContext context, GoRouterState state) =>
                const WatchClientScreen(),
          ),
          GoRoute(
            path: 'add-new-buy',
            builder: (BuildContext context, GoRouterState state) =>
                const AddNewBuyToClientScreen(),
          ),
        ]),
    GoRoute(
      path: '/router',
      builder: (BuildContext context, GoRouterState state) =>
          const RouterScreen(),
    ),
  ],
);
