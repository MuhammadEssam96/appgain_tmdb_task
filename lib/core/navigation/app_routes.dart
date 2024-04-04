import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/navigation/app_route_names.dart';
import 'package:tmdb_movies/features/home/presentation/screens/home_screen.dart';
import 'package:tmdb_movies/features/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:tmdb_movies/features/splash/presentation/screens/splash_screen.dart';

final List<GoRoute> routes = <GoRoute>[
  GoRoute(
    path: RouteNames.splash,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage<void>(
        key: state.pageKey,
        child: const SplashScreen(),
      );
    },
  ),
  GoRoute(
    path: RouteNames.home,
    pageBuilder: (BuildContext context, GoRouterState state) {
      return MaterialPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      );
    },
  ),
  GoRoute(
    path: RouteNames.movieDetails,
    pageBuilder: (BuildContext context, GoRouterState state) {
      final int id = int.parse(state.pathParameters['id'] ?? '1');
      final String? posterPath = state.extra as String?;

      return MaterialPage<void>(
        key: state.pageKey,
        child: MovieDetailsScreen(
          posterPath: posterPath,
          id: id,
        ),
      );
    },
  ),
  GoRoute(
    path: '/tmdb-movies',
    redirect: (BuildContext context, GoRouterState state) {
      return '/';
    },
  ),
  GoRoute(
    path: '/tmdb-movies/:id',
    redirect: (BuildContext context, GoRouterState state) {
      if (state.pathParameters['id'] != null) {
        final String movieId = state.pathParameters['id'].toString();
        return '/movies/$movieId';
      } else {
        return '/';
      }
    },
  ),
];
