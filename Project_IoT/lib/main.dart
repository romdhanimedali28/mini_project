import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_iot/View/application/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
