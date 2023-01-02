import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iot/View/screen/homepage/homepage.dart';
import 'package:project_iot/View/theme/color.dart';
import 'package:project_iot/View/theme/detailsplatform.dart';

import '../../../Controller/controller_regester/controller_login_regester.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //image login
            SizedBox(
              height: 300,
              width: width,
              child: Lottie.asset('assets/lottie/login1.json'),
            ),
            //email
            GetBuilder<LoginController>(builder: (context) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: TextFormField(
                      onChanged: (value) {
                        _loginController.validEmail(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _loginController.loginEmailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.alternate_email_rounded,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        errorStyle: const TextStyle(fontSize: 12),
                        errorText: _loginController.erorrEmail
                            ? "Email Invalid"
                            : null,
                      )));
            }),
            const SizedBox(
              height: 20,
            ),
            //password
            GetBuilder<LoginController>(builder: (context) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: TextFormField(
                      onChanged: (value) {
                        _loginController.validPass(value);
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: _loginController.loginpasswordController,
                      obscureText: _loginController.eye,
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                          size: 18,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _loginController.changevisibilityPass();
                          },
                          child: _loginController.eye
                              ? const Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black,
                                  size: 18,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.black,
                                  size: 18,
                                ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0.5, color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        errorStyle: const TextStyle(fontSize: 12),
                        errorText: _loginController.erorrPass
                            ? "Password Invalid"
                            : null,
                      )));
            }),
            const SizedBox(
              height: 10,
            ),

            ///forget password
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text("Forget Password?",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///login button
            GetBuilder<LoginController>(builder: (context) {
              return GestureDetector(
                onTap: () async {
                  _loginController.validalldata();
                  await _loginController.login(
                      _loginController.loginEmailController.text,
                      _loginController.loginpasswordController.text);
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      if (_loginController.credential != null) {
                        Get.to(HomePage());
                      } else {
                        Get.defaultDialog(
                          title: "Error To Login",
                          middleText: "Error Try agin.",
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("Try Agin"),
                            )
                          ],
                        );
                      }
                    },
                  );
                },
                child: Container(
                  width: width,
                  height: height * 0.06,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _loginController.activelogin
                          ? ColorManager.puregold
                          : Colors.grey),
                  child: const Center(
                      child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),

            ///chnage to regester
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account?",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    final ProfileHome profileHome = Get.find();
                    profileHome.changebetweenloginandregester(1);
                  },
                  child: Text(
                    "Register",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18, color: ColorManager.mettalicgold),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
