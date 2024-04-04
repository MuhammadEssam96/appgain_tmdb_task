import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/navigation/app_route_names.dart';
import 'package:tmdb_movies/core/navigation/app_routes.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: RouteNames.splash,
  routes: routes,
  debugLogDiagnostics: true,
);
