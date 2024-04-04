import 'package:dio/dio.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movie_details/data/datasources/remote/remote_movie_details_source.dart';
import 'package:tmdb_movies/features/movie_details/data/repositories/movie_details_repository_impl.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:tmdb_movies/features/movie_details/domain/usecases/get_popular_movies_usecase.dart';

void initializeMovieDetailsServiceLocators() {
  
  sl..registerLazySingleton<RemoteMovieDetailsSource>(() => RemoteMovieDetailsSource(sl<Dio>()))
    ..registerLazySingleton<MovieDetailsRepository>(() => MovieDetailsRepositoryImpl(sl<RemoteMovieDetailsSource>()))
    ..registerLazySingleton<GetMovieDetailsUsecase>(() => GetMovieDetailsUsecase(sl<MovieDetailsRepository>()));
}
