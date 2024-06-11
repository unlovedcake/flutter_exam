import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_exam/utils/my_logger.dart';
import 'package:get/get.dart';

class DioExceptions implements Exception {
  String message = '';
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = ApiMessageException.requestCanceled.tr;
        log('Error Message: $message');
        break;
      case DioExceptionType.connectionTimeout:
        message = ApiMessageException.connectionTimeout.tr;
        MyLogger.printError('Error Message: $message');

        break;
      case DioExceptionType.receiveTimeout:
        message = ApiMessageException.receiveTimeout.tr;
        MyLogger.printError('Error Message: $message');
        break;
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode!.toInt() == 404) {
          message = ApiMessageException.invalidUrl.tr;
        } else if (dioError.response!.statusCode!.toInt() == 401) {
          String jsonString = dioError.response!.data;

          message = jsonString;
          //Since the api I use not returning message error. I comment this line of codes
          // Map<String, dynamic> jsonData = json.decode(jsonString);
          // message = jsonData['message'];
        } else if (dioError.response!.statusCode!.toInt() == 400) {
          String jsonString = dioError.response!.data;

          message = jsonString;

          // Map<String, dynamic> jsonData = json.decode(jsonString);
          // message = jsonData['message'];
        } else if (dioError.response!.statusCode!.toInt() == 500) {
          message = 'Server Error';
          // String jsonString = dioError.response!.data;
          // Map<String, dynamic> jsonData = json.decode(jsonString);
          // message = jsonData['message'];
        } else {
          message = 'Something went wrong';
        }
        MyLogger.printError('Error Message: $message');

        break;
      case DioExceptionType.badCertificate:
        message = ApiMessageException.badRequest.tr;
        MyLogger.printError('Error Message: $message');
        break;
      case DioExceptionType.sendTimeout:
        message = ApiMessageException.sendTimeout.tr;
        MyLogger.printError('Error Message: $message');
        break;
      case DioExceptionType.connectionError:
        message = ApiMessageException.connectionProblem.tr;
        MyLogger.printError('Error Message: $message');
        break;
      case DioExceptionType.unknown:
        message = ApiMessageException.connectionProblem.tr;
        MyLogger.printError('Error Message: $message');
        break;
      default:
        message = ApiMessageException.somethingWrong.tr;
        MyLogger.printError('Error Message: $message');
        break;
    }
  }

  @override
  String toString() => message;
}

class ApiMessageException {
  /// API EXCEPTIONS
  static const String requestCanceled = "Request cancelled!";
  static const String connectionTimeout = "Connection timeout!";
  static const String receiveTimeout = "Receive timeout!";
  static const String sendTimeout = "Send timeout!";
  static const String connectionProblem = "Connection problem!";
  static const String connectionError = "Connection error!";
  static const String somethingWrong = "Something went wrong!";
  static const String badRequest = "Bad request";
  static const String unAuthorized = "Unauthorized";
  static const String invalidUrl = "Invalid URL";
  static const String internalServerError = "Internal Server Error";
}
