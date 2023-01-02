import 'package:flutter/material.dart';
import 'package:project_iot/View/screen/guide/guidehome.dart';

import '../../theme/detailsplatform.dart';

class Splach extends StatelessWidget {
  const Splach({super.key});

  @override
  Widget build(BuildContext context) {
    init(context);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => HomeGuide(),
            ),
            (route) => false);
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
