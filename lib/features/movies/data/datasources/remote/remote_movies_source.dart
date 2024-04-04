import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tmdb_movies/core/data/models/base_paginated_response.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';

part 'remote_movies_source.g.dart';

@RestApi()
abstract class RemoteMoviesSource {
  const factory RemoteMoviesSource(Dio dio, {String baseUrl}) = _RemoteMoviesSource;

  @GET('/movie/popular')
  Future<HttpResponse<BasePaginatedResponse<Movie>>> getPopularMovies({
    @Query('page')
    required int page,
  });
}
