import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_shimmer_widget.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/actor_entity.dart';

class ActorInfo extends StatelessWidget {
  final Actor actor;

  const ActorInfo({
    required this.actor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: actor.profilePath != null && actor.profilePath!.isNotEmpty ? CachedNetworkImage(
            key: ValueKey<String>(actor.name),
            imageUrl: 'https://media.themoviedb.org/t/p/w440_and_h660_face${actor.profilePath}',
            height: 72.h,
            width: 72.h,
            fit: BoxFit.cover,
            placeholder: (BuildContext context, _) {
              return SizedBox(
                height: 72.h,
                width: 72.w,
                child: const AppShimmerWidget(),
              );
            },
            errorWidget: (BuildContext context, _, dynamic ___) {
              return SizedBox(
                height: 72.h,
                width: 72.w,
                child: const AppShimmerWidget(),
              );
            },
          ) : SizedBox(
            height: 72.h,
            width: 72.w,
            child: const AppShimmerWidget(),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          actor.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
            fontSize: 12.sp,
            height: 15.h / 12.sp,
          ),
          
        ),
        SizedBox(height: 4.h),
        Text(
          actor.character,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
            fontSize: 12.sp,
            height: 15.h / 12.sp,
            color: const Color(0xFF9C9C9C),
          ),
        ),
      ],
    );
  }
}
