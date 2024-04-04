part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();  

  @override
  List<Object> get props => <Object>[];
}
class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MovieDetailsSuccess({
    required this.movieDetails,
  });
}

class MovieDetailsError extends MovieDetailsState {
  final String errorMessage;

  const MovieDetailsError({
    required this.errorMessage,
  });
}
