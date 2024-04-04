import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';

class AppShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadiusDirectional borderRadius;
  final Color color;

  const AppShimmerWidget({
    this.width,
    this.height,
    this.color = AppColors.secondaryColor,
    this.borderRadius = BorderRadiusDirectional.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      colorOpacity: 0.2,
      color: color,
      duration: const Duration(milliseconds: 1200),
      child: width == null && height == null ? const SizedBox.expand() : SizedBox(
        width: width?.w,
        height: height?.h,
      ),
    );
  }
}
