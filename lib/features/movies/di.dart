import 'package:dio/dio.dart';
import 'package:tmdb_movies/di.dart';
import 'package:tmdb_movies/features/movies/data/datasources/remote/remote_movies_source.dart';
import 'package:tmdb_movies/features/movies/data/repositories/movies_repository_impl.dart';
import 'package:tmdb_movies/features/movies/domain/repositories/movies_repository.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_popular_movies_usecase.dart';

void initializeMoviesServiceLocators() {
  
  sl..registerLazySingleton<RemoteMoviesSource>(() => RemoteMoviesSource(sl<Dio>()))
    ..registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl<RemoteMoviesSource>()))
    ..registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(sl<MoviesRepository>()));
}
