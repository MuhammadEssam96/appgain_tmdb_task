import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_shimmer_widget.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';

class PopularMovieShimmeringCard extends StatelessWidget {
  const PopularMovieShimmeringCard({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 370.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: const Color(0xFFE3E3E3),
          width: 1.w,
        ),
        color: AppColors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(2.w, 8.h),
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          AppShimmerWidget(
            width: 180.w,
            height: 270.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 8.h),
                  AppShimmerWidget(
                    height: 20.h,
                    width: 100.w,
                    borderRadius: BorderRadiusDirectional.circular(16.r),
                  ),
                  const Spacer(),
                  AppShimmerWidget(
                    height: 16.h,
                    width: 70.w,
                    borderRadius: BorderRadiusDirectional.circular(16.r),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );  
  }
}
