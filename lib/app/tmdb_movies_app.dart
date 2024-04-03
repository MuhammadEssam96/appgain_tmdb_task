import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_movies/core/navigation/app_router.dart';
import 'package:tmdb_movies/core/theme/app_themes.dart';

class TmdbMoviesApp extends StatefulWidget {
  const TmdbMoviesApp({super.key});

  @override
  State<TmdbMoviesApp> createState() => _TmdbMoviesAppState();
}

class _TmdbMoviesAppState extends State<TmdbMoviesApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightThemeData,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
