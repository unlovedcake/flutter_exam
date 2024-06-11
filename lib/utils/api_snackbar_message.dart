import 'package:flutter_exam/utils/api_exceptions_error.dart';
import 'package:flutter_exam/utils/custom_snackbar.dart';

mixin ApiSnackBarMessage {
  void errorApiMessage(error) {
    var errorText = DioExceptions.fromDioError(error).toString();

    CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: errorText,
        duration: const Duration(seconds: 4));
  }

  void successApiMessage(message) {
    CustomSnackBar.showCustomSuccessSnackBar(
        title: 'Success',
        message: message,
        duration: const Duration(seconds: 4));
  }

  void errorMessageService(errorMessage) {
    CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: errorMessage,
        duration: const Duration(seconds: 4));
  }
}
