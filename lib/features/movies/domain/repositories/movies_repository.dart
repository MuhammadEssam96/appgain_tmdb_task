import 'package:tmdb_movies/core/data/models/base_paginated_response.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  const MoviesRepository();

  Future<BaseResponseState<BasePaginatedResponse<Movie>>> getMovieDetails({
    required int page,
  });
}
