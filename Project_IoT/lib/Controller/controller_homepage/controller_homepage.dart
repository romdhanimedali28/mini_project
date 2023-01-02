import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController {
  int index = 0;
  changeindex(int value) {
    index = value;
    update();
  }
}

class MapController extends GetxController {
  Set<Marker> mymarkers = {};
  final CameraPosition position = const CameraPosition(
    target: LatLng(35.5238488, 11.0307638),
    zoom: 18.4746,
  );
  _getmarkers(double lat, double log) async {
    mymarkers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(lat, log),
        icon: await BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/location/car_pin.png")));
    update();
  }
}

class SensorController extends GetxController {
  List<String> namesensor = [
    "Raspberry Pi 4",
    "Arduino Uno R3",
    "GSM : SIM800L",
    "GPS : neo-6m",
    "Bluetooth HM-10", //4
    "Camera Pi 5MP", //5
    "Capteur De Mouvement", //6
  ];
  String imagesensor = "assets/sensor/s";

  List<bool> statesensor = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
}

class ProfileController extends GetxController {
  bool camera = true;
  bool location = true;
  activationcamera(bool value) {
    camera = value;
    update();
  }

  activationgps(bool value) {
    location = value;
    update();
  }
}
