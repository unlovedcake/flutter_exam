import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Random String'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(shape: BoxShape.rectangle),
                    child: Text(
                      controller.randomString.value.isEmpty
                          ? ''
                          : controller.randomString.value,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.getRandomString();
                    },
                    child: Text('Get Random String')),
              ],
            )),
    );
  }
}
