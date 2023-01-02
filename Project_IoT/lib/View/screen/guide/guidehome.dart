import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/Controller/controller_guide_splash/controller_guide_splash.dart';
import 'package:project_iot/View/screen/profilenotConnected/homeprofilenotconnected.dart';
import 'package:project_iot/View/theme/color.dart';
import 'package:project_iot/View/theme/detailsplatform.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../application/constant.dart';

class HomeGuide extends StatelessWidget {
  HomeGuide({super.key});

  final ControllerGuide _guideController = Get.put(ControllerGuide());

  @override
  Widget build(BuildContext context) {
    init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            left: 0,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _guideController.controllerpage,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                  child: Image.asset(
                    "$imageguide${index + 1}.png",
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.high,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _guideController.controllerpage,
                  count: 6,
                  effect: ExpandingDotsEffect(
                    activeDotColor: ColorManager.puregold,
                    dotHeight: 7,
                    dotWidth: 10,
                    expansionFactor: 3,
                    spacing: 3,
                  ),
                ),
                GetBuilder<ControllerGuide>(builder: (context) {
                  return MaterialButton(
                    onPressed: () {
                      if (_guideController.controllerpage.page! < 5) {
                        _guideController.changepage();
                      } else {
                        Get.to(() => ProfleNotConnected());
                      }
                    },
                    splashColor: ColorManager.fortunagold,
                    color: ColorManager.puregold,
                    shape: const CircleBorder(),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: _guideController.inmax
                            ? const Icon(
                                Icons.done_rounded,
                                size: 35,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.navigate_next_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
