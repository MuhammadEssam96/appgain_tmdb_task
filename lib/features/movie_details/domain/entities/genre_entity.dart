import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'genre_entity.g.dart';
part 'genre_entity.freezed.dart';

@Freezed()
@HiveField(3)
class Genre with _$Genre {
  const factory Genre({
    @HiveField(0)
    required int id,

    @HiveField(1) 
    required String name,
  }) = _Genre;

  @JsonSerializable()
  const Genre._();

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
