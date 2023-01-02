import 'package:flutter/cupertino.dart';

late double height;
late double width;
init(BuildContext context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
}
