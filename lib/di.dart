import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_movies/core/data/remote/dio_client.dart';
import 'package:tmdb_movies/features/movie_details/di.dart';
import 'package:tmdb_movies/features/movies/di.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeServiceLocators() async {
  final Dio dio = initDio(dotenv.env['BASE_URL']!);
  sl.registerSingleton<Dio>(dio);

  initializeMoviesServiceLocators();

  initializeMovieDetailsServiceLocators();
}
