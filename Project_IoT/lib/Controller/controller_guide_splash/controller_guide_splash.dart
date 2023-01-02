import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/Controller/controller_regester/controller_login_regester.dart';
import 'package:project_iot/View/screen/profilenotConnected/homeprofilenotconnected.dart';

class ControllerGuide extends GetxController {
  final PageController controllerpage = PageController();
  bool inmax = false;
  changepage() {
    controllerpage.nextPage(
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
    if (controllerpage.page == 4) {
      inmax = true;
    }

    update();
  }
}
