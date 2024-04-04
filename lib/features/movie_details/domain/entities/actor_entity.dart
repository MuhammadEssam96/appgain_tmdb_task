import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'actor_entity.g.dart';
part 'actor_entity.freezed.dart';

@Freezed()
@HiveType(typeId: 5)
class Actor with _$Actor {
  const factory Actor({
    @HiveField(0) 
    required String name,

    @JsonKey(name: 'profile_path')
    @HiveField(1)
    required String? profilePath,

    @HiveField(2)
    required String character,
    
  }) = _Actor;

  @JsonSerializable()
  const Actor._();

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}
