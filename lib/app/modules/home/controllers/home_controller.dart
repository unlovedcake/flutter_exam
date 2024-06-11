import 'package:flutter_exam/app/repositories/auth_repository.dart';
import 'package:flutter_exam/app/services/auth_service.dart';
import 'package:flutter_exam/utils/api_snackbar_message.dart';
import 'package:flutter_exam/utils/loading_indicator.dart';
import 'package:flutter_exam/utils/my_logger.dart';
import 'package:get/get.dart';

enum RandomStringStatus { initial, loading, loaded, error }

class HomeController extends GetxController with ApiSnackBarMessage {
  AuthService authService = AuthService(AuthRepository());

  final randomString = ''.obs;
  final _status = RandomStringStatus.initial.obs;

  bool get isLoading => _status.value == RandomStringStatus.loading;

  @override
  void onInit() {
    super.onInit();
  }

  void getRandomString() async {
    try {
      _status.value = RandomStringStatus.loading;
      LoadingIndicator.showLoadingIndicator(' Fetching Data...');

      final response = await authService.getRandomString();

      randomString.value = response.randomString;

      if (randomString.value.isNotEmpty) {
        _status.value = RandomStringStatus.loaded;
        MyLogger.printSuccess(
            'Success Get Random String ${randomString.value}');
        LoadingIndicator.closeLoadingIndicator();
      }
    } catch (e) {
      MyLogger.printError('Error: $e');
      _status.value = RandomStringStatus.error;
      LoadingIndicator.closeLoadingIndicator();
      errorApiMessage(e);
    }
  }
}
