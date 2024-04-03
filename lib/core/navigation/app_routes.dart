import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/navigation/app_route_names.dart';
import 'package:tmdb_movies/features/splash/presentation/screens/splash_screen.dart';

final List<GoRoute> routes = <GoRoute>[
  GoRoute(
    path: RouteNames.splash,
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
];
