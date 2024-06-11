import 'package:dio/dio.dart';
import 'package:flutter_exam/constants/api_base_url.dart';
import 'package:flutter_exam/utils/dio_interceptor.dart';
import 'package:flutter_exam/utils/my_logger.dart';

class AuthRepository {
  late Dio _dio;

  final Duration _requestTimeout = const Duration(minutes: 2);

  AuthRepository() {
    final options = BaseOptions(
      baseUrl: ApiBaseUrl.baseUrl,
      connectTimeout: _requestTimeout,
      receiveTimeout: _requestTimeout,
      contentType: 'application/json',
    );

    _dio = Dio(options);
    _dio.interceptors.add(DioInterceptor());
  }

  Future<String> getRandomString() async {
    try {
      var response = await _dio.get(
        ApiBaseUrl.baseUrl,
        options: Options(responseType: ResponseType.plain),
      );

      MyLogger.printSuccess('Get Response: $response');

      return response.data;
    } catch (e) {
      MyLogger.printError('Error: $e');
      rethrow;
    }
  }
}
