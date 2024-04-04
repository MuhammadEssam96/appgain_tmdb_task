import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  const MovieDetailsRepository();

  Future<BaseResponseState<MovieDetails>> getMovieDetails({
    required int id,
  });
}
