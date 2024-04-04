import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TokenInterceptor extends Interceptor {
  const TokenInterceptor();
  
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    final String? token = dotenv.maybeGet('TMDB_ACCESS_TOKEN');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    super.onRequest(options, handler);
  }
}
