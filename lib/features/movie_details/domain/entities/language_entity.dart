import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'language_entity.g.dart';
part 'language_entity.freezed.dart';

@Freezed()
@HiveType(typeId: 2)
class Language with _$Language {
  const factory Language({ 
    @JsonKey(name: 'english_name')
    @HiveField(0)
    required String englishName,
  }) = _Language;

  @JsonSerializable()
  const Language._();

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}
