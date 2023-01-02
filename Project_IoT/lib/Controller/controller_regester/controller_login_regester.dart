import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_iot/View/screen/profilenotConnected/login.dart';
import 'package:project_iot/View/screen/profilenotConnected/register.dart';

import '../../View/screen/homepage/homepage.dart';

class ProfileHome extends GetxController {
  List<Widget> logReg = [Login(), Regester()];
  int index = 0;
  changebetweenloginandregester(int value) {
    index = value;
    update();
  }
}

class LoginController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();
  bool erorrEmail = false;
  bool erorrPass = false;
  bool eye = true;
  bool activelogin = false;
  validalldata() {
    if (validEmail(loginEmailController.text) &&
        validPass(loginpasswordController.text)) {
      activelogin = true;
    } else {
      activelogin = false;
    }
    update();
  }

  bool validEmail(String email) {
    if (!email.isEmail || email.isEmpty) {
      erorrEmail = true;
      update();
      return false;
    } else {
      erorrEmail = false;
      update();
      return true;
    }
  }

  changevisibilityPass() {
    eye = !eye;
    update();
  }

  bool validPass(String pass) {
    if (pass.length < 10 || pass.isEmpty) {
      erorrPass = true;
      update();
      return false;
    } else {
      erorrPass = false;
      update();
      return true;
    }
  }

  UserCredential? credential;
  login(String email, String pass) async {
    if (activelogin) {
      try {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.defaultDialog(
            title: "Error Email",
            middleText: "No user found for that email.",
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"),
              )
            ],
          );
        } else if (e.code == 'wrong-password') {
          Get.defaultDialog(
            title: "Error Password",
            middleText: "Wrong password provided for that user.",
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Ok"),
              )
            ],
          );
        }
      }
    }
  }
}

class RegesterController extends GetxController {
  final TextEditingController regesterEmailController = TextEditingController();
  final TextEditingController regesterpasswordController =
      TextEditingController();
  final TextEditingController regesterconfirmpasswordController =
      TextEditingController();
  final TextEditingController regestersystemphoneController =
      TextEditingController();
  final TextEditingController regesterpersonalphoneController =
      TextEditingController();
  final TextEditingController regesterfirstnameController =
      TextEditingController();
  final TextEditingController regesterlastnameController =
      TextEditingController();

  bool erorrEmail = false;
  bool erorrPass = false;
  bool erorrConPass = false;
  bool erorrLname = false;
  bool erorrFname = false;
  bool erorrPnum = false;
  bool erorrSnum = false;
  bool eyepass = true;
  bool eyeconpass = true;
  bool activeregester = false;

  changevisibilityPass() {
    eyepass = !eyepass;
    update();
  }

  changevisibilityConPass() {
    eyeconpass = !eyeconpass;
    update();
  }

  validfname(String fname) {
    if (fname.isEmpty) {
      erorrFname = true;
    } else {
      erorrFname = false;
      if (!erorrEmail &&
          !erorrLname &&
          !erorrPass &&
          !erorrPnum &&
          !erorrSnum &&
          !erorrConPass) {
        activeregester = true;
      }
    }
    update();
  }

  validlname(String lname) {
    if (lname.isEmpty) {
      erorrLname = true;
    } else {
      erorrLname = false;
      if (!erorrEmail &&
          !erorrFname &&
          !erorrPass &&
          !erorrPnum &&
          !erorrSnum &&
          !erorrConPass) {
        activeregester = true;
      }
    }
    update();
  }

  validEmail(String email) {
    if (!email.isEmail || email.isEmpty) {
      erorrEmail = true;
    } else {
      erorrEmail = false;
      if (!erorrFname &&
          !erorrLname &&
          !erorrPass &&
          !erorrPnum &&
          !erorrSnum &&
          !erorrConPass) {
        activeregester = true;
      }
    }
    update();
  }

  validPass(String pass) {
    if (pass.length < 10 || pass.isEmpty) {
      erorrPass = true;
    } else {
      erorrPass = false;
      if (!erorrFname &&
          !erorrLname &&
          !erorrEmail &&
          !erorrPnum &&
          !erorrSnum &&
          !erorrConPass) {
        activeregester = true;
      }
    }
    update();
  }

  validConPass(String pass, String conpass) {
    if (pass != conpass) {
      erorrConPass = true;
    } else {
      erorrConPass = false;
      if (!erorrFname &&
          !erorrLname &&
          !erorrEmail &&
          !erorrPnum &&
          !erorrSnum &&
          !erorrPass) {
        activeregester = true;
      }
    }
    update();
  }

  validPnum(String pnum) {
    if (pnum.isEmpty) {
      erorrPnum = true;
    } else {
      erorrPnum = false;
      if (!erorrFname &&
          !erorrLname &&
          !erorrEmail &&
          !erorrConPass &&
          !erorrSnum &&
          !erorrPass) {
        activeregester = true;
      }
    }
    update();
  }

  validSnum(String snum) {
    if (snum.isEmpty) {
      erorrSnum = true;
    } else {
      erorrSnum = false;
      if (!erorrFname &&
          !erorrLname &&
          !erorrEmail &&
          !erorrConPass &&
          !erorrPnum &&
          !erorrPass) {
        activeregester = true;
      }
    }
    update();
  }

  UserCredential? credential;
  sinup(String email, String password) async {
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        users
            .doc(email)
            .set(
              {
                'First Name': regesterfirstnameController.text,
                'Last Name': regesterlastnameController.text,
                'Email': regesterEmailController.text,
                'Password': regesterpasswordController.text,
                'Number Personal': regesterpersonalphoneController.text,
                'Number System': regestersystemphoneController.text,
              },
              SetOptions(merge: true),
            )
            .then((value) => Get.to(HomePage()))
            .catchError((error) => print("Failed to merge data: $error"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Error Password",
          middleText: "The password provided is too weak.",
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Ok"),
            )
          ],
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "Error Email",
          middleText: "The account already exists for that email.",
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Ok"),
            )
          ],
        );
      }
    } catch (e) {
      print(e);
    }
  }
}

class ForgetPasswordController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();
}

class VerifyController extends GetxController {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();
}
