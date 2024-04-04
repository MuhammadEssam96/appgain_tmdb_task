import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsUsecase{
  final MovieDetailsRepository _movieDetailsRepository;

  const GetMovieDetailsUsecase(this._movieDetailsRepository);

  Future<BaseResponseState<MovieDetails>> call(int id) async {
    return _movieDetailsRepository.getMovieDetails(id: id);
  }
}
