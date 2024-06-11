import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_exam/utils/asset_path.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Developer Candidates',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    child: Obx(
                      () => controller.randomString.value.isEmpty
                          ? Container(
                              color: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  Image.asset(
                                    AssetPath.smiley,
                                    width: height * .6,
                                    height: height * .2,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'The Random String Story',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: controller
                                                  .randomString.value.isEmpty
                                              ? Colors.blue
                                              : Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              height: height * .26,
                              width: width * .9,
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.grey.shade200),
                              child: Text(
                                textAlign: TextAlign.center,
                                controller.randomString.value,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: controller.randomString.value.isEmpty
                                        ? Colors.blue
                                        : Colors.black),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: _buttonGetRandomString(controller)),
                  SizedBox(
                    height: 20,
                  ),
                  _buttonReset(controller),
                ],
              ),
            ),
          ),
          Obx(() => controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox()),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Developer: ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Mon R. de la Victoria',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buttonGetRandomString(HomeController controller) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            controller.getRandomString();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, foregroundColor: Colors.white
              // Background color
              ),
          child: Text(
            'Get Random String',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          )),
    );
  }

  Container _buttonReset(HomeController controller) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            controller.randomString.value = '';
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, foregroundColor: Colors.white
              // Background color
              ),
          child: Text(
            'Reset',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          )),
    );
  }
}
