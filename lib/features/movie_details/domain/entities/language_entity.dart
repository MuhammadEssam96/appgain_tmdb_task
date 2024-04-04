import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_entity.g.dart';
part 'language_entity.freezed.dart';

@Freezed()
class Language with _$Language {
  const factory Language({ 
    @JsonKey(name: 'english_name')
    required String englishName,
  }) = _Language;

  @JsonSerializable()
  const Language._();

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}
