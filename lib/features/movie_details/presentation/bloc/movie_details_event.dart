part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => <Object>[];
}

class MovieDetailsFetchingStarted extends MovieDetailsEvent {
  final int id;

  const MovieDetailsFetchingStarted({
    required this.id,
  });
}
