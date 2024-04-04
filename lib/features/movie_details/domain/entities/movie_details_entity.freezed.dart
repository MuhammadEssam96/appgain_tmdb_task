// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) {
  return _MovieDetails.fromJson(json);
}

/// @nodoc
mixin _$MovieDetails {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String get tagline => throw _privateConstructorUsedError;
  @HiveField(3)
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  @HiveField(4)
  DateTime get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  @HiveField(5)
  String get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'spoken_languages')
  @HiveField(6)
  List<Language> get spokenLanguages => throw _privateConstructorUsedError;
  @HiveField(7)
  List<Genre> get genres => throw _privateConstructorUsedError;
  @HiveField(8)
  Credits get credits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieDetailsCopyWith<MovieDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailsCopyWith<$Res> {
  factory $MovieDetailsCopyWith(
          MovieDetails value, $Res Function(MovieDetails) then) =
      _$MovieDetailsCopyWithImpl<$Res, MovieDetails>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String tagline,
      @HiveField(3) String overview,
      @JsonKey(name: 'release_date') @HiveField(4) DateTime releaseDate,
      @JsonKey(name: 'poster_path') @HiveField(5) String posterPath,
      @JsonKey(name: 'spoken_languages')
      @HiveField(6)
      List<Language> spokenLanguages,
      @HiveField(7) List<Genre> genres,
      @HiveField(8) Credits credits});

  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class _$MovieDetailsCopyWithImpl<$Res, $Val extends MovieDetails>
    implements $MovieDetailsCopyWith<$Res> {
  _$MovieDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? tagline = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? posterPath = null,
    Object? spokenLanguages = null,
    Object? genres = null,
    Object? credits = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      spokenLanguages: null == spokenLanguages
          ? _value.spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditsCopyWith<$Res> get credits {
    return $CreditsCopyWith<$Res>(_value.credits, (value) {
      return _then(_value.copyWith(credits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MovieDetailsImplCopyWith<$Res>
    implements $MovieDetailsCopyWith<$Res> {
  factory _$$MovieDetailsImplCopyWith(
          _$MovieDetailsImpl value, $Res Function(_$MovieDetailsImpl) then) =
      __$$MovieDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String tagline,
      @HiveField(3) String overview,
      @JsonKey(name: 'release_date') @HiveField(4) DateTime releaseDate,
      @JsonKey(name: 'poster_path') @HiveField(5) String posterPath,
      @JsonKey(name: 'spoken_languages')
      @HiveField(6)
      List<Language> spokenLanguages,
      @HiveField(7) List<Genre> genres,
      @HiveField(8) Credits credits});

  @override
  $CreditsCopyWith<$Res> get credits;
}

/// @nodoc
class __$$MovieDetailsImplCopyWithImpl<$Res>
    extends _$MovieDetailsCopyWithImpl<$Res, _$MovieDetailsImpl>
    implements _$$MovieDetailsImplCopyWith<$Res> {
  __$$MovieDetailsImplCopyWithImpl(
      _$MovieDetailsImpl _value, $Res Function(_$MovieDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? tagline = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? posterPath = null,
    Object? spokenLanguages = null,
    Object? genres = null,
    Object? credits = null,
  }) {
    return _then(_$MovieDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tagline: null == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
      spokenLanguages: null == spokenLanguages
          ? _value._spokenLanguages
          : spokenLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as Credits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieDetailsImpl extends _MovieDetails {
  const _$MovieDetailsImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.tagline,
      @HiveField(3) required this.overview,
      @JsonKey(name: 'release_date') @HiveField(4) required this.releaseDate,
      @JsonKey(name: 'poster_path') @HiveField(5) required this.posterPath,
      @JsonKey(name: 'spoken_languages')
      @HiveField(6)
      required final List<Language> spokenLanguages,
      @HiveField(7) required final List<Genre> genres,
      @HiveField(8) required this.credits})
      : _spokenLanguages = spokenLanguages,
        _genres = genres,
        super._();

  factory _$MovieDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieDetailsImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String tagline;
  @override
  @HiveField(3)
  final String overview;
  @override
  @JsonKey(name: 'release_date')
  @HiveField(4)
  final DateTime releaseDate;
  @override
  @JsonKey(name: 'poster_path')
  @HiveField(5)
  final String posterPath;
  final List<Language> _spokenLanguages;
  @override
  @JsonKey(name: 'spoken_languages')
  @HiveField(6)
  List<Language> get spokenLanguages {
    if (_spokenLanguages is EqualUnmodifiableListView) return _spokenLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spokenLanguages);
  }

  final List<Genre> _genres;
  @override
  @HiveField(7)
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  @HiveField(8)
  final Credits credits;

  @override
  String toString() {
    return 'MovieDetails(id: $id, title: $title, tagline: $tagline, overview: $overview, releaseDate: $releaseDate, posterPath: $posterPath, spokenLanguages: $spokenLanguages, genres: $genres, credits: $credits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality()
                .equals(other._spokenLanguages, _spokenLanguages) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.credits, credits) || other.credits == credits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      tagline,
      overview,
      releaseDate,
      posterPath,
      const DeepCollectionEquality().hash(_spokenLanguages),
      const DeepCollectionEquality().hash(_genres),
      credits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailsImplCopyWith<_$MovieDetailsImpl> get copyWith =>
      __$$MovieDetailsImplCopyWithImpl<_$MovieDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieDetailsImplToJson(
      this,
    );
  }
}

abstract class _MovieDetails extends MovieDetails {
  const factory _MovieDetails(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String title,
      @HiveField(2) required final String tagline,
      @HiveField(3) required final String overview,
      @JsonKey(name: 'release_date')
      @HiveField(4)
      required final DateTime releaseDate,
      @JsonKey(name: 'poster_path')
      @HiveField(5)
      required final String posterPath,
      @JsonKey(name: 'spoken_languages')
      @HiveField(6)
      required final List<Language> spokenLanguages,
      @HiveField(7) required final List<Genre> genres,
      @HiveField(8) required final Credits credits}) = _$MovieDetailsImpl;
  const _MovieDetails._() : super._();

  factory _MovieDetails.fromJson(Map<String, dynamic> json) =
      _$MovieDetailsImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String get tagline;
  @override
  @HiveField(3)
  String get overview;
  @override
  @JsonKey(name: 'release_date')
  @HiveField(4)
  DateTime get releaseDate;
  @override
  @JsonKey(name: 'poster_path')
  @HiveField(5)
  String get posterPath;
  @override
  @JsonKey(name: 'spoken_languages')
  @HiveField(6)
  List<Language> get spokenLanguages;
  @override
  @HiveField(7)
  List<Genre> get genres;
  @override
  @HiveField(8)
  Credits get credits;
  @override
  @JsonKey(ignore: true)
  _$$MovieDetailsImplCopyWith<_$MovieDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
