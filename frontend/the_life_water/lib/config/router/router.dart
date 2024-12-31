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
            path: 'informe',
            builder: (BuildContext context, GoRouterState state) =>
                const GenerationInfoScreen(),
          ),
          GoRoute(
              path: 'product',
              builder: (BuildContext context, GoRouterState state) =>
                  const ProductScreen(),
              routes: [
                GoRoute(
                  path: 'create_new_product',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreateNewProductScreen(),
                ),
              ]),
          GoRoute(
              path: 'watchclient',
              builder: (BuildContext context, GoRouterState state) =>
                  const WatchClientScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'createnewclient',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreateNewClientScreen(),
                ),
              ]),
          GoRoute(
            path: 'addnewbuy',
            builder: (BuildContext context, GoRouterState state) =>
                const AddNewBuyToClientScreen(),
          ),
          GoRoute(
            path: 'orders',
            builder: (BuildContext context, GoRouterState state) =>
                const OrdersScreen(),
          ),
        ]),
    GoRoute(
      path: '/router',
      builder: (BuildContext context, GoRouterState state) =>
          const RouterScreen(),
    ),
  ],
);
