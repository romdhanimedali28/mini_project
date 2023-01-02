import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_iot/View/theme/color.dart';

import '../../../Controller/controller_homepage/controller_homepage.dart';

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final MapController _mapController = Get.put(MapController());

  final Completer<GoogleMapController> _controller = Completer();
  bool p = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref('data/open');
  @override
  void initState() {
    data();
    super.initState();
  }

  data() {
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        if (data == 1) {
          p = true;
        } else {
          p = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.onInit();
        },
        child: Icon(Icons.send),
      ),
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return SafeArea(
              child: Stack(
                children: [
                
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GetBuilder<MapController>(builder: (context) {
                      return GoogleMap(
                        mapType: MapType.normal,
                        markers: _mapController.mymarkers,
                        initialCameraPosition: _mapController.position,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      );
                    }),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 30,
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: ColorManager.puregold)),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                color: p ? Colors.green : Colors.red,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(14),
                                    bottomLeft: Radius.circular(14))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              width: 150,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 10, right: 0),
                                      child: Text(
                                        "Driver: Romdhani Mohamed Ali",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5, right: 0),
                                      child: Text(
                                        "Location: Tunise, Kairouan",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5, right: 0),
                                      child: Text(
                                        "Model: BMW X7",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5, right: 0),
                                      child: Text("Speed: 120Km"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 5, right: 0),
                                      child: Text("Date: 2022/12/10"),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 5, right: 0),
                                        child: Text("Time: 16:25:30")),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
