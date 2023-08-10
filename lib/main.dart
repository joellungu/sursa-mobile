import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sursa_mobile/pages/accueil.dart';
import 'package:sursa_mobile/pages/splash.dart';

import 'pages/details.dart';
import 'pages/login/login_controller.dart';
import 'pages/profil/profil_controller.dart';
import 'utils/app_controller.dart';

void main() async {
  //
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  await GetStorage.init();
  //
  LoginController loginController = Get.put(LoginController());
  //
  AppController appController = Get.put(AppController());
  //
  ProfilController profilController = Get.put(ProfilController());
  //
  runApp(Sursa());
}

class Sursa extends StatelessWidget {
  const Sursa({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SURSA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:
          //Details({}),
          //Accueil()
          Splash(),
    );
  }
}
