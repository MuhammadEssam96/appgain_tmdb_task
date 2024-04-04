import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/core/data/remote/base_api_repository.dart';
import 'package:tmdb_movies/features/movie_details/data/datasources/remote/remote_movie_details_source.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl extends BaseApiRepository implements MovieDetailsRepository {
  final RemoteMovieDetailsSource _remoteMovieDetailsSource;

  const MovieDetailsRepositoryImpl(this._remoteMovieDetailsSource);

  @override
  Future<BaseResponseState<MovieDetails>> getMovieDetails({required int id}) {
    return getStateOf(
      request: () {
        return _remoteMovieDetailsSource.getMovieDetails(id: id);
      },
    );
  }
}
