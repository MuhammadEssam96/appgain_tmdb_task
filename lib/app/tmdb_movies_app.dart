import 'package:flutter/material.dart';
import 'package:tmdb_movies/core/navigation/app_router.dart';
import 'package:tmdb_movies/core/theme/app_themes.dart';

class AppgainTmdbTaskApp extends StatefulWidget {
  const AppgainTmdbTaskApp({super.key});

  @override
  State<AppgainTmdbTaskApp> createState() => _AppgainTmdbTaskAppState();
}

class _AppgainTmdbTaskAppState extends State<AppgainTmdbTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
