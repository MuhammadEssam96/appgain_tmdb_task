import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/credits_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/genre_entity.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/language_entity.dart';

part 'movie_details_entity.g.dart';
part 'movie_details_entity.freezed.dart';

@Freezed()
@HiveType(typeId: 1)
class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    @HiveField(0)
    required String title,

    @HiveField(1)
    required String tagline,

    @HiveField(2)
    required String overview,

    @JsonKey(name: 'release_date')
    @HiveField(3)
    required DateTime releaseDate,

    @JsonKey(name: 'poster_path')
    @HiveField(4)
    required String posterPath,

    @JsonKey(name: 'spoken_languages')
    @HiveField(5)
    required List<Language> spokenLanguages,

    @HiveField(6)
    required List<Genre> genres,

    @HiveField(7)
    required Credits credits,
  }) = _MovieDetails;

  @JsonSerializable()
  const MovieDetails._();

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
}
