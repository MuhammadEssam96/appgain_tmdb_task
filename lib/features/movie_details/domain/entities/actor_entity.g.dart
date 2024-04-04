// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActorImpl _$$ActorImplFromJson(Map<String, dynamic> json) => _$ActorImpl(
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
    );

Map<String, dynamic> _$$ActorImplToJson(_$ActorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
    };
