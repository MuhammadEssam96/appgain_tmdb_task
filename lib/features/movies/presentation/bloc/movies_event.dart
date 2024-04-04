part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => <Object>[];
}

class MoviesFetchingStarted extends MoviesEvent {
  final int page;

  const MoviesFetchingStarted({
    required this.page,
  });
}
