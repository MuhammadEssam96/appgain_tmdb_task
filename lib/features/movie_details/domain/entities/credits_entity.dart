import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmdb_movies/features/movie_details/domain/entities/actor_entity.dart';

part 'credits_entity.g.dart';
part 'credits_entity.freezed.dart';

@Freezed()
class Credits with _$Credits {
  const factory Credits({
    required List<Actor> cast,
  }) = _Credits;

  @JsonSerializable()
  const Credits._();

  factory Credits.fromJson(Map<String, dynamic> json) => _$CreditsFromJson(json);
}
