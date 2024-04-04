import 'package:json_annotation/json_annotation.dart';

part 'base_paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePaginatedResponse<T> {
  final int page;
  final List<T> results;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'total_results')
  final int totalResults;

  const BasePaginatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory BasePaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$BasePaginatedResponseFromJson(json, fromJsonT);
}
