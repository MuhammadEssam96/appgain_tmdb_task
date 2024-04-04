import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';

class GenreChip extends StatelessWidget {
  final String name;

  const GenreChip({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 4.h,
      ),
      child: Text(
        name.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          fontSize: 8.sp,
          height: 10.h / 8.sp,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
