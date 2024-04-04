import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_entity.g.dart';
part 'genre_entity.freezed.dart';

@Freezed()
class Genre with _$Genre {
  const factory Genre({
    required int id, 
    required String name,
  }) = _Genre;

  @JsonSerializable()
  const Genre._();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
