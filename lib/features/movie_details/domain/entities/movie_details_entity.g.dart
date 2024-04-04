// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 1;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      id: fields[0] as int,
      title: fields[1] as String,
      tagline: fields[2] as String,
      overview: fields[3] as String,
      releaseDate: fields[4] as DateTime,
      posterPath: fields[5] as String,
      spokenLanguages: (fields[6] as List).cast<Language>(),
      genres: (fields[7] as List).cast<Genre>(),
      credits: fields[8] as Credits,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.tagline)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.posterPath)
      ..writeByte(6)
      ..write(obj.spokenLanguages)
      ..writeByte(7)
      ..write(obj.genres)
      ..writeByte(8)
      ..write(obj.credits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailsImpl _$$MovieDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailsImpl(
      id: json['id'] as int,
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
      'id': instance.id,
      'title': instance.title,
      'tagline': instance.tagline,
      'overview': instance.overview,
      'release_date': instance.releaseDate.toIso8601String(),
      'poster_path': instance.posterPath,
      'spoken_languages': instance.spokenLanguages,
      'genres': instance.genres,
      'credits': instance.credits,
    };
