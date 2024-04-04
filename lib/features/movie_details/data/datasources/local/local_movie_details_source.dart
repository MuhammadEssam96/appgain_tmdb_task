import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/movie_details_entity.dart';

class LocalMovieDetailsDataSource {
  final Box<MovieDetails> _box = Hive.box<MovieDetails>('movies');

  Future<List<MovieDetails>> getMovieDetails() async {
    return _box.values.toList();
  }

  Future<MovieDetails?> getMovieDetailsById(int id) async {
    return _box.values.firstWhere((MovieDetails element) => element.id == id);
  }

  Future<int> addMovieDetailsItem(MovieDetails item) async {
    return _box.add(item);
  }

  Future<void> removeMovieDetailsItem(int index) async {
    await _box.deleteAt(index);
  }

  Future<bool> isMovieDetailsItemAdded(int id) async {
    return _box.values.toList().any((MovieDetails e) => e.id == id);
  }
}
