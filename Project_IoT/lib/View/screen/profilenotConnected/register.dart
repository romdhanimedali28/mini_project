import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_iot/View/theme/color.dart';
import 'package:project_iot/View/theme/detailsplatform.dart';

import '../../../Controller/controller_regester/controller_login_regester.dart';

class Regester extends StatelessWidget {
  Regester({super.key});
  final RegesterController _regesterController = Get.put(RegesterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: width,
              child: Lottie.asset('assets/lottie/regester.json'),
            ),
            GetBuilder<RegesterController>(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 2,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                _regesterController.validfname(value);
                              },
                              keyboardType: TextInputType.name,
                              controller: _regesterController
                                  .regesterfirstnameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_rounded,
                                  size: 22,
                                  color: Colors.black,
                                ),
                                hintText: "First Name",
                                border: InputBorder.none,
                                errorText: _regesterController.erorrFname
                                    ? "First Name Invalid"
                                    : null,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5, color: Colors.black54),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: ColorManager.puregold),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: width / 2,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              onChanged: (value) {
                                _regesterController.validlname(value);
                              },
                              keyboardType: TextInputType.name,
                              controller: _regesterController
                                  .regesterlastnameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_rounded,
                                  color: Colors.black,
                                  size: 22,
                                ),
                                hintText: "Last Name",
                                border: InputBorder.none,
                                errorText: _regesterController.erorrLname
                                    ? "Last Name Invalid"
                                    : null,
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 0.5, color: Colors.black54),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.black54),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //email
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextFormField(
                          onChanged: (value) {
                            _regesterController.validEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller:
                              _regesterController.regesterEmailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.alternate_email_rounded,
                              color: Colors.black,
                              size: 18,
                            ),
                            errorText: _regesterController.erorrEmail
                                ? "Email Invalid"
                                : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(fontSize: 12),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  //password
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextFormField(
                          onChanged: (value) {
                            _regesterController.validPass(value);
                          },
                          keyboardType: TextInputType.visiblePassword,
                          controller:
                              _regesterController.regesterpasswordController,
                          obscureText: _regesterController.eyepass,
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
                                _regesterController.changevisibilityPass();
                              },
                              child: _regesterController.eyepass
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
                            errorText: _regesterController.erorrPass
                                ? "Password Invalid"
                                : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(fontSize: 12),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  //confirm password
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextFormField(
                          onChanged: (value) {
                            _regesterController.validConPass(
                                _regesterController
                                    .regesterpasswordController.text,
                                value);
                          },
                          keyboardType: TextInputType.visiblePassword,
                          controller: _regesterController
                              .regesterconfirmpasswordController,
                          obscureText: _regesterController.eyeconpass,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 18,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _regesterController.changevisibilityConPass();
                              },
                              child: _regesterController.eyeconpass
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
                            errorText: _regesterController.erorrConPass
                                ? "Confirm Password Invalid"
                                : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(fontSize: 12),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  //phone number
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextFormField(
                          onChanged: (value) {
                            _regesterController.validPnum(value);
                          },
                          keyboardType: TextInputType.number,
                          controller: _regesterController
                              .regesterpersonalphoneController,
                          decoration: InputDecoration(
                            hintText: "Personal Phone Number",
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.black,
                              size: 18,
                            ),
                            errorText: _regesterController.erorrPnum
                                ? "Persoanl Number Invalid"
                                : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(fontSize: 12),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: TextFormField(
                          onChanged: (value) {
                            _regesterController.validSnum(value);
                          },
                          keyboardType: TextInputType.number,
                          controller:
                              _regesterController.regestersystemphoneController,
                          decoration: InputDecoration(
                            hintText: "System Phone Number",
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: Colors.black,
                              size: 18,
                            ),
                            errorText: _regesterController.erorrSnum
                                ? "System Number Invalid"
                                : null,
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle: const TextStyle(fontSize: 12),
                          ))),
                  const SizedBox(
                    height: 20,
                  ),

                  ///regetser button
                  GestureDetector(
                    onTap: () {
                      if (_regesterController.activeregester) {
                        _regesterController.sinup(
                            _regesterController.regesterEmailController.text,
                            _regesterController
                                .regesterpasswordController.text);
                      }
                    },
                    child: Container(
                      width: width,
                      height: height * 0.06,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: _regesterController.activeregester
                              ? ColorManager.puregold
                              : Colors.grey),
                      child: const Center(
                          child: Text(
                        "Regester",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                ],
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
                  "have an account?",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    final ProfileHome profileHome = Get.find();
                    profileHome.changebetweenloginandregester(0);
                  },
                  child: Text(
                    "Login",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18, color: ColorManager.mettalicgold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      )),
    );
  }
}
