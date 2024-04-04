import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';
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

  late final PagingController<int, Movie> _pagingController;
  
  @override
  void initState() {
    super.initState();

    _pagingController = PagingController<int, Movie>(
      firstPageKey: 1,
    );

    _moviesRefreshController = RefreshController();
    
    _moviesBloc = BlocProvider.of<MoviesBloc>(context);

    if (_moviesBloc.state is MoviesInitial) {
      _moviesBloc.add(
        const MoviesFetchingStarted(page: 1),
      );
    } else if (_moviesBloc.state is MoviesListSuccess) {
      if ((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.totalPages > 1) {
        _pagingController.appendPage((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.results, 2);
      } else {
        _pagingController.appendLastPage((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.results);
      }
    } else {
      _pagingController.appendLastPage(<Movie>[]);
    }

    _pagingController.addPageRequestListener((int pageKey) {
      if (_moviesBloc.state is MoviesListSuccess) {
        if ((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.results.isNotEmpty) {
          if ((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.totalPages >= pageKey) {
            _moviesBloc.add(
              MoviesFetchingStarted(page: pageKey),
            );
          } else {
            _pagingController.appendLastPage((_moviesBloc.state as MoviesListSuccess).moviesPaginatedResponse.results);
          }
        } else {
          _moviesBloc.add(
            MoviesFetchingStarted(page: pageKey),
          );
        }
      }
    });
  }

  void moviesBlocListener(BuildContext context, MoviesState state) {
    if (state is MoviesListSuccess) {
      _moviesRefreshController.refreshCompleted();

      if (state.moviesPaginatedResponse.page == 1) {
        _pagingController.itemList?.clear();
      }

      if (state.moviesPaginatedResponse.totalPages == 0) {
        _pagingController.appendLastPage(<Movie>[]);
      } else if (state.moviesPaginatedResponse.totalPages > state.moviesPaginatedResponse.page) {
        _pagingController.appendPage(state.moviesPaginatedResponse.results, state.moviesPaginatedResponse.page + 1);
      } else {
        _pagingController.appendLastPage(state.moviesPaginatedResponse.results);
      }
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
                onRefresh: () => _pagingController.refresh(),
                child: PagedGridView<int, Movie>(
                  pagingController: _pagingController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 8.w,
                    childAspectRatio: 180.w / 370.h,
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w).add(EdgeInsets.only(bottom: 150.h)),
                  builderDelegate: PagedChildBuilderDelegate<Movie>(
                    firstPageProgressIndicatorBuilder: (_) => SizedBox(
                      height: 370.h,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 180.w / 370.h,
                        ),
                        itemBuilder: (_, __) => const PopularMovieShimmeringCard(),
                        itemCount: 7,
                      ),
                    ),
                    itemBuilder: (_, Movie movie, __) => PopularMovieCard(movie: movie), 
                    animateTransitions: true,
                    newPageProgressIndicatorBuilder: (_) => const PopularMovieShimmeringCard(),
                  ),
                ), 
              );
            },
          ),
        ),
      ],
    );
  }
}
