part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();  

  @override
  List<Object> get props => <Object>[];
}

class MoviesInitial extends MoviesState {
  const MoviesInitial();
}

class MoviesListLoading extends MoviesState {
  const MoviesListLoading();
}

class MoviesListSuccess extends MoviesState {
  final BasePaginatedResponse<Movie> moviesPaginatedResponse;

  const MoviesListSuccess({
    required this.moviesPaginatedResponse,
  });
}

class MoviesListError extends MoviesState {
  final String errorMessage;

  const MoviesListError({
    required this.errorMessage,
  });
}
