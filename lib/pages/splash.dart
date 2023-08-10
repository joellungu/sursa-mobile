import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile/utils/app_controller.dart';
import 'accueil.dart';
import 'login/login.dart';

class Splash extends StatelessWidget {
  //
  //
  Splash() {
    var box = GetStorage();
    Map agent = box.read("agent") ?? {};
    Timer(const Duration(seconds: 4), () {
      if (agent['id'] == null) {
        Get.off(Login());
      } else {
        Get.off(Accueil());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Coat_of_arms_of_the_Democratic_Republic_of_the_Congo.svg.png",
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/logo_MIN SANTE.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/LOGO SURSA TTRANSPARENT.png",
                width: 250,
                height: 250,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 40,
        alignment: Alignment.center,
        child: const Text(
          "Republique Démocratique du Congo",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
