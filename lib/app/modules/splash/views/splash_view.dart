import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/app/modules/home/views/home_view.dart';

import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 200,
        splash: Icon(Icons.logo_dev),
        nextScreen: HomeView(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}
