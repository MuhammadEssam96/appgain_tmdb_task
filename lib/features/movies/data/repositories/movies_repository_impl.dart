import 'package:tmdb_movies/core/data/models/base_paginated_response.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/core/data/remote/base_api_repository.dart';
import 'package:tmdb_movies/features/movies/data/datasources/remote/remote_movies_source.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';
import 'package:tmdb_movies/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends BaseApiRepository implements MoviesRepository {
  final RemoteMoviesSource _remoteMoviesSource;

  const MoviesRepositoryImpl(this._remoteMoviesSource);

  @override
  Future<BaseResponseState<BasePaginatedResponse<Movie>>> getMovieDetails({required int page}) {
    return getStateOf(
      request: () {
        return _remoteMoviesSource.getPopularMovies(page: page);
      },
    );
  }
}
