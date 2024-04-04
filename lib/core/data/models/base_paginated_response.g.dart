// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaginatedResponse<T> _$BasePaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePaginatedResponse<T>(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$BasePaginatedResponseToJson<T>(
  BasePaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results.map(toJsonT).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
