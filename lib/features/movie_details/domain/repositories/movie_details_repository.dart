import 'package:either_dart/either.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  const MovieDetailsRepository();

  Future<Either<Future<BaseResponseState<MovieDetails>>, MovieDetails>> getMovieDetails({
    required int id,
  });

  Future<void> saveMovieDetails(MovieDetails movieDetails);
}
