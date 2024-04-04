// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailsImpl _$$MovieDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailsImpl(
      title: json['title'] as String,
      tagline: json['tagline'] as String,
      overview: json['overview'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      posterPath: json['poster_path'] as String,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MovieDetailsImplToJson(_$MovieDetailsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'tagline': instance.tagline,
      'overview': instance.overview,
      'release_date': instance.releaseDate.toIso8601String(),
      'poster_path': instance.posterPath,
      'spoken_languages': instance.spokenLanguages,
      'genres': instance.genres,
      'credits': instance.credits,
    };
