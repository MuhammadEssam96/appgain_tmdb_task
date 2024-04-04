import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_shimmer_widget.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_switcher_widget.dart';
import 'package:tmdb_movies/core/theme/app_colors.dart';
import 'package:tmdb_movies/core/theme/app_system_ui_overlay_styles.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/actor_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/genre_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:tmdb_movies/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:tmdb_movies/features/movie_details/presentation/widgets/actor_info_widget.dart';
import 'package:tmdb_movies/features/movie_details/presentation/widgets/genre_chip_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;

  const MovieDetailsScreen({
    required this.id,
    super.key,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieDetailsBloc _movieDetailsBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailsBloc = MovieDetailsBloc(sl<MovieDetailsRepository>())..add(
      MovieDetailsFetchingStarted(id: widget.id),
    );  
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUiOverlayStyles.darkStatusBarIconsStyle.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.white,
      ),
      child: BlocProvider<MovieDetailsBloc>.value(
        value: _movieDetailsBloc,
        child: Scaffold(
          body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (BuildContext context, MovieDetailsState state) {
              return AppAnimatedSwitcher(
                child: state is MovieDetailsSuccess ? CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: true,
                      elevation: 8.h,
                      systemOverlayStyle: AppSystemUiOverlayStyles.lightStatusBarIconsStyle.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: AppColors.white,
                      ),
                      expandedHeight: 310.h - kToolbarHeight,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              key: ValueKey<String>(state.movieDetails.posterPath),
                              imageUrl: 'https://media.themoviedb.org/t/p/w440_and_h660_face${state.movieDetails.posterPath}',
                              height: 315.h,
                              width: 393.w,
                              fit: BoxFit.cover,
                              placeholder: (BuildContext context, _) {
                                return SizedBox(
                                  height: 315.h,
                                  width: 393.w,
                                  child: const AppShimmerWidget(),
                                );
                              },
                              errorWidget: (BuildContext context, _, dynamic ___) {
                                return SizedBox(
                                  height: 315.h,
                                  width: 393.w,
                                  child: const AppShimmerWidget(),
                                );
                              },
                            ),
                            Container(
                              height: 315.h,
                              width: 393.w,
                              color: AppColors.primaryColor.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList.list(
                      children: <Widget>[
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Text(
                            state.movieDetails.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.2,
                              fontSize: 20.sp,
                              height: 25.h / 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Text(
                            state.movieDetails.tagline,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2,
                              fontSize: 12.sp,
                              height: 15.h / 12.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
                          child: Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: state.movieDetails.genres.map((Genre genre) {
                              return GenreChip(name: genre.name);
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Release date',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.2,
                                        fontSize: 12.sp,
                                        height: 15.h / 12.sp,
                                        color: const Color(0xFF9C9C9C),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      DateFormat('MMMM dd yyyy').format(state.movieDetails.releaseDate),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                        fontSize: 12.sp,
                                        height: 15.h / 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Language',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.2,
                                        fontSize: 12.sp,
                                        height: 15.h / 12.sp,
                                        color: const Color(0xFF9C9C9C),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      state.movieDetails.spokenLanguages.first.englishName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.2,
                                        fontSize: 12.sp,
                                        height: 15.h / 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.2,
                                  fontSize: 16.sp,
                                  height: 20.h / 16.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                state.movieDetails.overview,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.2,
                                  fontSize: 12.sp,
                                  height: 22.h / 12.sp,
                                  color: const Color(0xFF9C9C9C),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Cast',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.2,
                                  fontSize: 16.sp,
                                  height: 20.h / 16.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Wrap(
                                spacing: 16.w,
                                runSpacing: 16.h,
                                alignment: WrapAlignment.spaceAround,
                                runAlignment: WrapAlignment.spaceEvenly,
                                children: state.movieDetails.credits.cast.map((Actor actor) {
                                  return ActorInfo(actor: actor);
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 150.h),
                      ],
                    ),
                  ],
                )
                : const Center(
                  child:  CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
