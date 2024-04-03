import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies/core/assets/app_logos.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';
import 'package:tmdb_movies/core/theme/app_system_ui_overlay_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      const Duration(seconds: 2), 
      () {
        context.go('/');
      },
    );  
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUiOverlayStyles.lightStatusBarIconsStyle.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.primaryColor,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Image.asset(
            AppLogos.primaryFull,
          ),
        ),
      ),
    );
  }
}
