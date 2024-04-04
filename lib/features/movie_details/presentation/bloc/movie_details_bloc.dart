import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/repositories/movie_details_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsRepository _movieDetailsRepository;

  MovieDetailsBloc(this._movieDetailsRepository) : super(const MovieDetailsInitial()) {
    on<MovieDetailsFetchingStarted>((MovieDetailsFetchingStarted event, Emitter<MovieDetailsState> emit) async {
      emit(const MovieDetailsLoading());

      try {
        final Either<Future<BaseResponseState<MovieDetails>>, MovieDetails> movieDetails = await _movieDetailsRepository.getMovieDetails(id: event.id);
      
        if (movieDetails is Left) {
          final BaseResponseState<MovieDetails> response = await movieDetails.left;
          if (response is ResponseSuccess) {
            await _movieDetailsRepository.saveMovieDetails(response.data!);
            
            emit(
              MovieDetailsSuccess(movieDetails: response.data!),
            );
          } else if (response is ResponseFailed) {
            emit(
              MovieDetailsError(errorMessage: response.errorMessage ?? 'error loading movie details'),
            );
          }
        } else {
          emit(
            MovieDetailsSuccess(movieDetails: movieDetails.right),
          );
        }
      } catch (e) {
        emit(
          MovieDetailsError(errorMessage: e.toString()),
        );
      }
    });
  }
}
