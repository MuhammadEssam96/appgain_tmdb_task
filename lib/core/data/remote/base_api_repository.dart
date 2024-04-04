import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tmdb_movies/core/data/models/base_response_state.dart';

abstract class BaseApiRepository {
  const BaseApiRepository();
  /// This method is responsible of handling the given `request`, in which
  /// it returns generic based `ResponseState`.
  ///
  /// Returns `ResponseSuccess` that holds the generic data `T` if the response
  /// is successfully received.
  ///
  /// Returns `ResponseFailed` that holds a `DioException` instance if any error occurs
  /// while sending the request or receiving the response.
  @protected
  Future<BaseResponseState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final HttpResponse<T> httpResponse = await request();
      return ResponseSuccess<T>(httpResponse.data, httpResponse.response.data);
    } on DioException catch (error) {
      return ResponseFailed<T>(
        error,
        _mapErrorMessage(error),
      );
    } catch (err, st){
      debugPrint(err.toString());
      debugPrintStack(stackTrace: st);
      
      return ResponseFailed<T>(
        null, 
        err.toString(),
      );
    }
  }

  String? _mapErrorMessage(DioException exception){
    String? errorMessage;
    try {
      final Map<String, dynamic>? data = exception.response?.data as Map<String, dynamic>?;
       errorMessage = (data?['message'] as String?) ?? (data?['detail'] as String?) ?? (data?['error'] as Map<String, dynamic>?)?['message'] as String?;
      if (errorMessage == null && data is Map && data!.values.isNotEmpty){
        errorMessage = (data.values.first as List<dynamic>).first as String;
      }
      return errorMessage;
    } catch (e) {
      return errorMessage;
    }
  }
}
