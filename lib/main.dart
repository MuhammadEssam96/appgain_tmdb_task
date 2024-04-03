import 'package:tmdb_movies/app/tmdb_movies_app.dart';
import 'package:tmdb_movies/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const AppgainTmdbTaskApp());
}
