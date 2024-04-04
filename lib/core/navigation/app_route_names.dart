import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteNames {
  const RouteNames._();
  
  static String get home => '/';
  static String get splash => '/splash';
  static String get movieDetails => '/movies/:id';
}
