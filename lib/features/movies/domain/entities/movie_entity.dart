// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.g.dart';
part 'movie_entity.freezed.dart';

@Freezed()
class Movie with _$Movie {
  const factory Movie({
    required String title,

    @JsonKey(name: 'poster_path')
    required String posterPath,

    @JsonKey(name: 'backdrop_path')
    required String? backdropPath,

    @JsonKey(name: 'release_date')
    required DateTime releaseDate,
  }) = _Movie;

  @JsonSerializable()
  const Movie._();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
