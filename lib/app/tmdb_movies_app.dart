import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tmdb_movies/core/navigation/app_router.dart';
import 'package:tmdb_movies/core/theme/app_themes.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movies/domain/repositories/movies_repository.dart';
import 'package:tmdb_movies/features/movies/presentation/bloc/movies_bloc.dart';

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
      child: MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<MoviesBloc>(
            create: (_) => MoviesBloc(sl<MoviesRepository>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightThemeData,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          builder: (_, Widget? child) {
            return RefreshConfiguration(
              headerBuilder: () {
                return const ClassicHeader(
                  idleText: 'Pull down to refresh',
                  releaseText: 'Release to refresh',
                  refreshingText: 'Loading',
                  completeText: 'Loading complete',
                  failedText: 'Failed to load',
                );
              },
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
