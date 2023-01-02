import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/View/screen/menu/menu.dart';
import 'package:project_iot/View/screen/profileConnected/homeprofile.dart';
import 'package:project_iot/View/screen/sensor/sensor.dart';
import 'package:project_iot/View/theme/color.dart';

import '../../../Controller/controller_homepage/controller_homepage.dart';

List<Widget> pagehomepage = [Menu(), Sensor(), Profile()];

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController _homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _homePageController.index,
          selectedItemColor: ColorManager.puregold,
          unselectedItemColor: ColorManager.blackgrey,
          elevation: 10,
          selectedLabelStyle:
              TextStyle(color: ColorManager.blackgold, fontSize: 18),
          unselectedLabelStyle:
              TextStyle(color: ColorManager.blackgrey, fontSize: 14),
          selectedIconTheme:
              IconThemeData(color: ColorManager.puregold, size: 22),
          unselectedIconTheme:
              IconThemeData(color: ColorManager.blackgrey, size: 17),
          items: const [
            BottomNavigationBarItem(
                label: "Map", icon: Icon(Icons.pin_drop_outlined)),
            BottomNavigationBarItem(
                label: "Sensors", icon: Icon(Icons.sensors_outlined)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person_outline)),
          ],
          onTap: (value) {
            _homePageController.changeindex(value);
          },
        ),
        body: pagehomepage[_homePageController.index],
      );
    });
  }
}
