import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/View/theme/color.dart';

import '../../../Controller/controller_homepage/controller_homepage.dart';

class Sensor extends StatelessWidget {
  Sensor({super.key});
  final SensorController _sensorController = Get.put(SensorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                                "${_sensorController.imagesensor}$index.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            _sensorController.namesensor[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: _sensorController.statesensor[index]
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: ColorManager.puregold,
                );
              },
              itemCount: _sensorController.namesensor.length),
        ),
      ),
    );
  }
}
