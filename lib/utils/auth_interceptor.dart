import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  late Dio interceptorDio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      ...options.headers,
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
