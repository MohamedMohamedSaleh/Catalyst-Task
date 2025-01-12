import 'package:dio/dio.dart';

import 'api_services.dart';
import 'end_ponits.dart';

class DioService extends ApiServices {
  final Dio dio;

  DioService({required this.dio}) {
    dio.options.headers = {'Content-Type': 'application/json', 'Accept': 'application/json'};
    dio.options.baseUrl = EndPoints.baseUrl;
    // dio.interceptors.add(ApiInterceptor());
    // dio.interceptors.add(LogInterceptor(
    //   request: true,
    //   requestHeader: true,
    //   requestBody: true,
    //   responseHeader: true,
    //   responseBody: true,
    //   error: true,
    // ));
  }

  @override
  Future<ResponseData> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return ResponseData(
          message: response.data['message'],
          isSuccess: true,
          response: response);
    } on DioException catch (e) {
      // handleDioExceptions(e);
      return ResponseData(
          message: e.response!.data['message'], isSuccess: false);
    }
  }

  @override
  Future<ResponseData> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return ResponseData(
          message: '', isSuccess: true, response: response);
    } on DioException catch (e) {

      // handleDioExceptions(e);
      return ResponseData(
          message: e.response?.data['message']?? "Error occured", isSuccess: false);
    }
  }

  @override
  Future<ResponseData> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return ResponseData(
          message: response.data['message'],
          isSuccess: true,
          response: response);
    } on DioException catch (e) {
      // handleDioExceptions(e);
      return ResponseData(
          message: e.response?.data['message']?? "Error occured", isSuccess: false);
    }
  }

  @override
  Future<ResponseData> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return ResponseData(
          message: response.data['message'],
          isSuccess: true,
          response: response);
    } on DioException catch (e) {
      // handleDioExceptions(e);
      return ResponseData(
          message: e.response?.data['message'] ?? "Error occured", isSuccess: false);
    }
  }
}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}
