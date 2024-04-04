import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tmdb_movies/core/components/animations/app_animated_switcher_widget.dart';
import 'package:tmdb_movies/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:tmdb_movies/features/movies/presentation/widgets/popular_movie_card_widget.dart';
import 'package:tmdb_movies/features/movies/presentation/widgets/popular_movie_shimmering_card_widget.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  late final MoviesBloc _moviesBloc;

  late final RefreshController _moviesRefreshController;
  
  @override
  void initState() {
    super.initState();

    _moviesRefreshController = RefreshController();
    
    _moviesBloc = BlocProvider.of<MoviesBloc>(context);

    if (_moviesBloc.state is MoviesInitial) {
      _moviesBloc.add(
        const MoviesFetchingStarted(page: 1),
      );
    }
  }

  void moviesBlocListener(BuildContext context, MoviesState state) {
    if (state is MoviesListSuccess) {
      _moviesRefreshController.refreshCompleted();
    } else if (state is MoviesListError) {
      _moviesRefreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Popular Movies',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: BlocConsumer<MoviesBloc, MoviesState>(
            listener: moviesBlocListener,
            builder: (BuildContext context, MoviesState state) {
              return SmartRefresher(
                controller: _moviesRefreshController,
                physics: const BouncingScrollPhysics(),
                onRefresh: () {
                  _moviesBloc.add(
                    const MoviesFetchingStarted(page: 1),
                  );
                },
                child: GridView.builder(
                  // key: ValueKey<MoviesState>(state),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 8.w,
                    childAspectRatio: 180.w / 370.h,
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w).add(EdgeInsets.only(bottom: 150.h)),
                  itemCount: state is MoviesListSuccess ? state.moviesPaginatedResponse.results.length : 10,
                  itemBuilder: (BuildContext context, int index) {
                    return AppAnimatedSwitcher(
                      child: state is MoviesListSuccess ? PopularMovieCard(
                        movie: state.moviesPaginatedResponse.results[index],
                      ) : const PopularMovieShimmeringCard(),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
