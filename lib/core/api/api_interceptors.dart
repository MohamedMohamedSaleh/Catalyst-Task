import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  // ignore: unnecessary_overrides
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {         
    super.onRequest(options, handler);
  }
}
