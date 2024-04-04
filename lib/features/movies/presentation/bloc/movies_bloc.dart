import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_movies/core/data/models/base_paginated_response.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie_entity.dart';
import 'package:tmdb_movies/features/movies/domain/repositories/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesBloc(this._moviesRepository) : super(const MoviesInitial()) {
    on<MoviesFetchingStarted>((MoviesFetchingStarted event, Emitter<MoviesState> emit) async {
      emit(const MoviesListLoading());

      try {
        final BaseResponseState<BasePaginatedResponse<Movie>> response = await _moviesRepository.getMovieDetails(page: event.page);
      
        if (response is ResponseSuccess) {
          emit(
            MoviesListSuccess(moviesPaginatedResponse: response.data!),
          );
        } else if (response is ResponseFailed) {
          emit(
            MoviesListError(errorMessage: response.errorMessage ?? 'error loading movies'),
          );
        }
      } catch (e) {
        emit(
          MoviesListError(errorMessage: e.toString()),
        );
      }
    });
  }
}
