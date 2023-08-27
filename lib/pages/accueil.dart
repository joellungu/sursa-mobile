import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details.dart';
import 'profil/profil.dart';
import 'scanner.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Accueil();
  }
}

class _Accueil extends State<Accueil> {
  //
  RxInt v = 0.obs;
  //
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  //
  @override
  void initState() {
    //
    super.initState();
  }

  //

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          body: Obx(
            () => v.value == 0 ? Scanner() : Profil(),
          ),
          //Details()
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              onTap: (e) {
                if (e == 0) {
                  v.value = e;
                  //ac.type.value = "sondage";
                } else {
                  v.value = e;
                  //ac.type.value = "taches";
                }
              },
              currentIndex: v.value,
              fixedColor: Colors.red.shade900,
              unselectedItemColor: Colors.grey.shade400,
              selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_sharp), label: "Scanner"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: "Profil"),
              ],
            ),
          ),
        ),
      ),
    );
  }
//
}
