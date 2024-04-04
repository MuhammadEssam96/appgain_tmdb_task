import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_shimmer_widget.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_switcher_widget.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';

class PopularMovieCard extends StatefulWidget {
  final Movie movie;
  
  const PopularMovieCard({
    required this.movie,
    super.key, 
  });

  @override
  State<PopularMovieCard> createState() => _PopularMovieCardState();
}

class _PopularMovieCardState extends State<PopularMovieCard> {
  bool cardIsTappedDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          cardIsTappedDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          cardIsTappedDown = false;
        });
      },
      onTapCancel: () {
        setState(() {
          cardIsTappedDown = false;
        });
      },
      onTap: () {
        context.push(
          '/movies/${widget.movie.id}',
          extra: widget.movie.posterPath,
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
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
            AppAnimatedSwitcher(
              child: Hero(
                tag: 'poster_path:${widget.movie.posterPath}',
                child: CachedNetworkImage(
                  key: ValueKey<String>(cardIsTappedDown && widget.movie.backdropPath != null ? widget.movie.backdropPath! : widget.movie.posterPath),
                  imageUrl: 'https://media.themoviedb.org/t/p/w440_and_h660_face${cardIsTappedDown ? widget.movie.backdropPath : widget.movie.posterPath}',
                  height: 270.h,
                  width: 180.w,
                  fit: BoxFit.fill,
                  placeholder: (BuildContext context, _) {
                    return SizedBox(
                      height: 270.h,
                      width: 180.w,
                      child: const AppShimmerWidget(),
                    );
                  },
                  errorWidget: (BuildContext context, _, dynamic ___) {
                    return SizedBox(
                      height: 270.h,
                      width: 180.w,
                      child: const AppShimmerWidget(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 8.h),
                    Expanded(
                      child: Text(
                        widget.movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      DateFormat('MMM dd, yyyy').format(widget.movie.releaseDate),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );  
  }
}
