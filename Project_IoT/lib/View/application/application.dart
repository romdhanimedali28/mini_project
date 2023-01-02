import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/View/screen/guide/guidehome.dart';

import '../screen/homepage/homepage.dart';
import '../screen/menu/menu.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: Menu());
  }
}
