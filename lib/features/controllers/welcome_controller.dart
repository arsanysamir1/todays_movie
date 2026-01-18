import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../util/constants/images.dart';
import 'hive_controller.dart';

class WelcomeController extends GetMaterialController {
  final PageController pageController = PageController(initialPage: 0);

  // 2. Define an Rx variable to hold the current index
  var currentPageIndex = 0.obs;


  void updatePageIndicator(index) {}

  void nextPage() {
    if (currentPageIndex.value == 2) {
      MyHive.setNewValue(key: "welcome",value: true);
      Get.offNamed("/signIn");
    } else {
      currentPageIndex.value++;
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    }

  }

  void skipPage() {
    MyHive.setNewValue(key: "welcome",value: true);
    Get.offNamed("/signIn");
  }
}
