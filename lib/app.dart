import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_exam/app/enums/flavor_enum.dart';
import 'package:flutter_exam/app/routes/app_pages.dart';
import 'package:flutter_exam/utils/my_logger.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      MyLogger.printSuccess('CURRENT FLAVOR: ${flavor.description}');
    }

    return GetMaterialApp(
      title: '${flavor.title} Flutter Candidates',
      initialRoute: AppPages.SPLASH,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: kDebugMode ? true : false,
      locale: Get.deviceLocale,
    );
  }
}
