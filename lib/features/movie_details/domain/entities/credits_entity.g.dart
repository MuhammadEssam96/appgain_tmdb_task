// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditsImpl _$$CreditsImplFromJson(Map<String, dynamic> json) =>
    _$CreditsImpl(
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Actor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreditsImplToJson(_$CreditsImpl instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };
