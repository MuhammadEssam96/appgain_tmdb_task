import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_movies/core/assets/app_logos.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';
import 'package:tmdb_movies/core/theme/app_system_ui_overlay_styles.dart';
import 'package:tmdb_movies/features/movies/presentation/pages/popular_movies_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUiOverlayStyles.lightStatusBarIconsStyle.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.white,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          elevation: 7.h,
          centerTitle: true,
          title: Image.asset(
            AppLogos.altShort,
            width: 140.w,
          ),
        ),
        body: const PopularMoviesPage(),
      ),
    );
  }
}
