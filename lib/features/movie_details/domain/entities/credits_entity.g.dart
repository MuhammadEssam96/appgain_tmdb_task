// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditsAdapter extends TypeAdapter<Credits> {
  @override
  final int typeId = 4;

  @override
  Credits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Credits(
      cast: (fields[0] as List).cast<Actor>(),
    );
  }

  @override
  void write(BinaryWriter writer, Credits obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
