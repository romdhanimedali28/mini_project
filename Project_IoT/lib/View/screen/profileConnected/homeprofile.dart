import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_iot/View/theme/color.dart';

import '../../../Controller/controller_homepage/controller_homepage.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 30, right: 0),
              child: Text(
                "Mr Romdhani Mohamed Ali",
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 10,
              ),
              child: Text(
                "Model: BMW X7",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, right: 0),
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 22, color: ColorManager.puregold),
              ),
            ),
            Container(
              height: 603,
              margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-1, -1),
                        spreadRadius: .2,
                        color: ColorManager.mettalicgold,
                        blurRadius: .3),
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                  // border: Border(
                  //   left: BorderSide(
                  //     color: ColorManager.puregold,
                  //     width: 1.5,
                  //   ),
                  //   top: BorderSide(
                  //     color: ColorManager.puregold,
                  //     width: 1.5,
                  //   ),
                  //   right: BorderSide(
                  //     color: ColorManager.puregold,
                  //     width: 1.5,
                  //   ),
                  //),
                  border: Border.all(color: ColorManager.puregold)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              MdiIcons.faceRecognition,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Face Recognition",
                            ),
                          ],
                        ),
                        GetBuilder<ProfileController>(builder: (context) {
                          return Switch(
                            activeColor: ColorManager.fortunagold,
                            value: _profileController.camera,
                            onChanged: (value) {
                              _profileController.activationcamera(value);
                            },
                          );
                        })
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 1, top: 10, right: 1),
                      child: Divider(
                          height: 1, thickness: 0.3, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.pin_drop_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Location Car",
                            ),
                          ],
                        ),
                        GetBuilder<ProfileController>(builder: (context) {
                          return Switch(
                            value: _profileController.location,
                            activeColor: ColorManager.fortunagold,
                            onChanged: (value) {
                              _profileController.activationgps(value);
                            },
                          );
                        })
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 1, top: 10, right: 1),
                      child: Divider(
                          height: 1, thickness: 0.3, color: Colors.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 0),
                    child: Text(
                      "Information",
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    height: 50,
                    child: MaterialButton(
                      minWidth: 380,
                      onPressed: () {},
                      splashColor: Colors.grey.shade50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.badge_outlined, size: 22),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Information Personal",
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0, right: 25),
                      child: Divider(
                          height: .5, thickness: 0.5, color: Colors.grey)),
                  SizedBox(
                    width: 390,
                    height: 50,
                    child: MaterialButton(
                      minWidth: 380,
                      onPressed: () {},
                      splashColor: Colors.grey.shade50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.lock_reset_outlined, size: 22),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Change Password",
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0, right: 25),
                      child: Divider(
                          height: .5, thickness: 0.5, color: Colors.grey)),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 0),
                    child: Text(
                      "Help Center",
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    height: 50,
                    child: MaterialButton(
                      minWidth: 380,
                      onPressed: () {},
                      splashColor: Colors.grey.shade50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(Icons.support_agent_outlined, size: 22),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Help",
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded)
                          ]),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, top: 0, right: 25),
                      child: Divider(
                          height: .5, thickness: 0.5, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
