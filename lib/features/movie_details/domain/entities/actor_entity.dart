import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_entity.g.dart';
part 'actor_entity.freezed.dart';

@Freezed()
class Actor with _$Actor {
  const factory Actor({ 
    required String name,

    @JsonKey(name: 'poster_path')
    required String posterPath,

    required String character,
    
  }) = _Actor;

  @JsonSerializable()
  const Actor._();

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
