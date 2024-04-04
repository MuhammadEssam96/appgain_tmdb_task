import 'package:dio/dio.dart';

abstract class BaseResponseState<T> {
  final T? data;
  final dynamic result;
  final DioException? error;
  final String? errorMessage;

  const BaseResponseState({
    this.data, 
    this.result, 
    this.error, 
    this.errorMessage,
  });
}

class ResponseSuccess<T> extends BaseResponseState<T> {
  const ResponseSuccess(T data, dynamic result) : super(data: data, result: result);
}

class ResponseFailed<T> extends BaseResponseState<T> {
  const ResponseFailed(DioException? error, String? errorMessage) : super(error: error, errorMessage: errorMessage);
}

class ResponseNotSet<T> extends BaseResponseState<T> {
  const ResponseNotSet();
}
