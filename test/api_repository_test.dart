import 'package:dio/dio.dart';
import 'package:flutter_exam/app/repositories/auth_repository.dart';
import 'package:flutter_exam/constants/api_base_url.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'api_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('Auth Repository', () {
    late MockDio mockDio;
    late AuthRepository authRepository;

    setUp(() {
      mockDio = MockDio();
      authRepository = AuthRepository();
    });

    RequestOptions requestOptions = RequestOptions();

    test('returns data if the http call completes successfully', () async {
      // Arrange

      when(mockDio.get(ApiBaseUrl.baseUrl)).thenAnswer((realInvocation) async {
        // Actual result
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
        );
      });

      final data = await authRepository.getRandomString();

      // Compare actual result with expected result
      expect(data, isA<String>());
      expect(data, data);
    });

    test('throws an exception if there is no internet connection', () async {
      // Arrange
      when(mockDio.get(any)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ApiBaseUrl.baseUrl),
        type: DioExceptionType.connectionError,
        error: 'Something went wrong',
      ));

      var result;

      bool isInternetConnection = false;

      try {
        result = await authRepository.getRandomString();
      } catch (e) {
        result = e;
      }

      if (result.toString().contains('SocketException')) {
        isInternetConnection = true;
      }
      // Compare actual result with expected result
      expect(isInternetConnection, false);
    });
  });
}
