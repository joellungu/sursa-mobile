import 'dart:convert';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile_2/pages/accueil.dart';
import 'package:sursa_mobile_2/pages/details.dart';
import 'package:sursa_mobile_2/pages/login/changer_mdp.dart';
import 'package:sursa_mobile_2/pages/login/code_envoyer.dart';
import 'package:sursa_mobile_2/pages/login/login.dart';

import 'requete.dart';

class AppController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  //
  Future<List> getPhotos(int id) async {
    d.Response rep = await requete.getE(
      "v-user/archive-photo?id=$id",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //api.sursa.cd/
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<void> login(Map e) async {
    //pseudo,pwd,profil, etat
    print(
        "${Requete.url}user/login?email=${e['email']}&pwd=${e['pwd']}&profil=Agent");
    //
    d.Response rep = await requete
        .getE("user/login?email=${e['email']}&pwd=${e['pwd']}&profil=Agent");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.data}");
      if (rep.data.isNotEmpty) {
        Map e = jsonDecode(rep.data);
        if (e["etat"] != null) {
          //
          if (e["etat"] == "non actif") {
            //
            print(rep.data);
            //

            //
            //box.write("user", rep.body);
            Get.back();
            Get.snackbar(
              "Compte",
              "Votre compte n'est pas actif veuillez contacter votre administrateur",
              backgroundColor: Colors.red.shade700,
              colorText: Colors.white,
            );
          } else {
            //
            print(rep.data);
            //
            box.write("user", json.decode(rep.data));

            //
            //box.write("user", rep.body);
            Get.back();
            Get.offAll(Accueil());
            //Get.snackbar("Succès", "L'authentification éffectué !");
          }
        } else {
          Get.back();
          Get.snackbar(
            "Oups",
            "Veuillez contacter votre administrateur. Compte non valide",
            colorText: Colors.white,
            backgroundColor: Colors.red.shade900,
          );
        }
        //
      } else {
        //
        print(rep.statusCode);
        print(rep.data);
        //
        Get.back();
        Get.snackbar(
          "Oups",
          "Veuillez contacter votre administrateur. Compte non valide",
          colorText: Colors.white,
          backgroundColor: Colors.red.shade900,
        );
      }
    } else {
      Get.snackbar("Erreur", "Un problème lors de l'authentification");
    }
  }

  //
  Future<void> miseAjour(Map e) async {
    d.Response rep = await requete
        .getE("user/pwd?pwd=${e['pwd']}&confirm=${e['pwd']}&id=${e['id']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("user ${rep.data}");
      Get.back();
      Get.snackbar("Succès", "La mise à jour éffectué");
      Get.offAll(Login());
    } else {
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //user/get?id=xxxxxxxx
  Future<void> scanner(String id) async {
    //
    Map user = box.read("user");
    //
    Get.dialog(
      Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
    //
    //print("rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep =
        await requete.getE("voyage/scan?id=${user['id']}&token=$id");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("rep: ${rep.data}");

      //box.write("user", rep.body);
      Get.back();
      //Get.snackbar("Succès", "La mise à jour éffectué");
      var rr = jsonDecode(rep.data);
      if (rr.runtimeType != List) {
        Get.to(Details(jsonDecode(rep.data)));
      } else {
        Get.snackbar("Erreur", "reponse : $rr");
      }
    } else {
      print("rep: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //
  Future<void> scannerTest() async {
    //
    Get.dialog(
      Container(
        height: 40,
        width: 40,
        child: const CircularProgressIndicator(),
        alignment: Alignment.center,
      ),
    );
    //
    //print("rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getEE();
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("rep: ${rep.data}");

      //box.write("user", rep.body);
      Get.back();
      //Get.snackbar("Succès", "La mise à jour éffectué");
      var rr = jsonDecode(rep.data);
      if (rr.runtimeType != Map) {
        Get.to(Details(jsonDecode(rep.data)));
      } else {
        Get.snackbar("Erreur", "reponse : $rr");
      }
    } else {
      print("rep: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

//
  //
  Future<List> getAgence() async {
    d.Response rep = await requete.getE(
      "ets/select",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<List> getPosteFrontalier() async {
    d.Response rep = await requete.getE(
      "poste/select",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("data  ${rep.data}");
      return jsonDecode(rep.data);
      //
      //change(rep.data, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
  }

  //
  Future<void> validation(
      String id, String id_user, String date_valid, String etat_valid) async {
    //print(form);
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "voyage/update?id=$id&id_valid=$id_user&etat_valid=$etat_valid",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");

      //box.write("user", rep.body);

      Get.back();
      Get.back();
      Get.snackbar("Succès", "La mise à jour éffectué");
      //Get.to(Details(jsonDecode(rep.data)));
    } else {
      print("rep: ${rep.data}");
      //Get.back();
      Get.snackbar("Erreur", "Un problème lors de la validation");
    }
  }

  //
  Future<void> mdpOublier(String email) async {
    print("user/forgot?email=$email");
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "user/forgot?email=$email",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      // print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");

      //box.write("user", rep.body);
      //

      Get.back();
      Get.to(CodeEnvoyer(email));
      //
      //Get.snackbar("Succès",
      //  "Code a été envoyé dans votre compte pour reeinitialiser votre mot de passe");
      //Get.to(Details(jsonDecode(rep.data)));
    } else {
      print("rep: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la vérification");
    }
  }

  //
  Future<void> testDeCode(String code, String email) async {
    print("user/valide?email=$email&code=$code");
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "user/validate?email=$email&code=$code",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      // print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");
      String token = rep.data;
      //box.write("user", rep.body);
      //
      if (token.isNotEmpty) {
        Get.back();
        Get.to(ChangeCode(email, token));
      } else {
        Get.back();
        Get.snackbar("Erreur", "Code expiré");
      }

      //
      //Get.snackbar("Succès",
      //  "Un email a été envoyé dans votre compte pour reeinitialiser votre mot de passe");
      //Get.to(Details(jsonDecode(rep.data)));
    } else {
      print("rep: ${rep.data}");
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de la vérification");
    }
  }

  //
  Future<void> mdpModifier(String token, String pwd) async {
    print("user/unit?token=$token&pwd=$pwd");
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "user/init?token=$token&pwd=$pwd",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      // print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");

      //box.write("user", rep.body);

      Get.back();
      Get.snackbar(
          "Succès", "Votre mot de passe a été reinitialisé avec succès");
      Get.offAll(Login());
    } else {
      print("rep: ${rep.data}");
      //Get.back();
      Get.snackbar("Erreur", "Un problème lors de la vérification");
    }
  }
  //
}
