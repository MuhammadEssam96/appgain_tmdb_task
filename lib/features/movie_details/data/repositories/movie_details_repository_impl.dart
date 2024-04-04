import 'package:either_dart/either.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/core/data/remote/base_api_repository.dart';
import 'package:tmdb_movies/features/movie_details/data/datasources/local/local_movie_details_source.dart';
import 'package:tmdb_movies/features/movie_details/data/datasources/remote/remote_movie_details_source.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl extends BaseApiRepository implements MovieDetailsRepository {
  final RemoteMovieDetailsSource _remoteMovieDetailsSource;
  final LocalMovieDetailsDataSource _localMovieDetailsDataSource;

  const MovieDetailsRepositoryImpl(this._remoteMovieDetailsSource, this._localMovieDetailsDataSource);

  @override
  Future<Either<Future<BaseResponseState<MovieDetails>>, MovieDetails>> getMovieDetails({required int id}) async {
    if (await _localMovieDetailsDataSource.isMovieDetailsItemAdded(id)) {
      final MovieDetails? movieDetails = await _localMovieDetailsDataSource.getMovieDetailsById(id);

      if (movieDetails != null) {
        return Right<Future<BaseResponseState<MovieDetails>>, MovieDetails>(
          movieDetails,
        );
      }
    }
    
    return Left<Future<BaseResponseState<MovieDetails>>, MovieDetails>(
      getStateOf(
        request: () {
          return _remoteMovieDetailsSource.getMovieDetails(id: id);
        },
      ),
    );
  }
  
  @override
  Future<void> saveMovieDetails(MovieDetails movieDetails) async {
    await _localMovieDetailsDataSource.addMovieDetailsItem(movieDetails);
  }
}
