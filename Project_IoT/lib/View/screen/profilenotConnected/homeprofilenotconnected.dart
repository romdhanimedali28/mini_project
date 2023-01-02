import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/controller_regester/controller_login_regester.dart';

class ProfleNotConnected extends StatelessWidget {
  ProfleNotConnected({super.key});
  final ProfileHome _profileHome = Get.put(ProfileHome());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileHome>(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: _profileHome.logReg[_profileHome.index]),
      );
    });
  }
}
