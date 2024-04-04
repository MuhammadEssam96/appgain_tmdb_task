import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tmdb_movies/core/data/remote/dio_token_interceptor.dart';

Dio initDio(String baseUrl) {
  final Dio dio = Dio()..options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
  );

  dio.interceptors.addAll(
    <Interceptor>[
      const TokenInterceptor(),
      RetryInterceptor(
        dio: dio,
        logPrint: (Object? object) => log(object.toString(), name: 'HTTP Retry'),
        retryDelays: const <Duration>[ // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
          Duration(seconds: 2), // wait 2 sec before second retry
          Duration(seconds: 3), // wait 3 sec before third retry
        ],
      ),
      if (kDebugMode) PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        compact: false,
        logPrint: (Object? object) => log(object.toString(), name: 'HTTP'),
      ), 
    ],
  );

  return dio;
}
