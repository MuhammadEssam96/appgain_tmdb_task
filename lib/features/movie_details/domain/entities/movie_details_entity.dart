import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/credits_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/genre_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/language_entity.dart';

part 'movie_details_entity.g.dart';
part 'movie_details_entity.freezed.dart';

@Freezed()
class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required String title,
    required String tagline,
    required String overview,

    @JsonKey(name: 'release_date')
    required DateTime releaseDate,

    @JsonKey(name: 'poster_path')
    required String posterPath,

    @JsonKey(name: 'spoken_languages')
    required List<Language> spokenLanguages,

    required List<Genre> genres,
    required Credits credits,
  }) = _MovieDetails;

  @JsonSerializable()
  const MovieDetails._();

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
