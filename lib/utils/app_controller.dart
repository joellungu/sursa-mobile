import 'dart:convert';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile/pages/accueil.dart';
import 'package:sursa_mobile/pages/details.dart';
import 'package:sursa_mobile/pages/login/login.dart';

import 'requete.dart';

class AppController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<void> login(Map e) async {
    //pseudo,pwd,profil, etat
    print(
        "${Requete.url}/api/?_c=user&_a=login&email=${e['email']}&pwd=${e['pwd']}&profil=agent");
    //
    d.Response rep = await requete.getE(
        "/api/?_c=user&_a=login&email=${e['email']}&pwd=${e['pwd']}&profil=agent");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print("rep: ${rep.data}");
      Map e = jsonDecode(rep.data);
      if (e["statut"] != null) {
        //
        if (e["statut"] == "non actif") {
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
      Get.snackbar("Erreur", "Un problème lors de la suppression");
    }
  }

  //
  Future<void> miseAjour(Map e) async {
    d.Response rep = await requete.getE(
        "/api/?_c=user&_a=pwd&pwd=${e['pwd']}&confirm=${e['pwd']}&id=${e['id']}");
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

  //api/user/get?id=xxxxxxxx
  Future<void> scanner(String id) async {
    //
    Get.dialog(Container(
      height: 40,
      width: 40,
      child: const CircularProgressIndicator(),
      alignment: Alignment.center,
    ));
    //
    print(
        "rep:  https://www.sky-workspace.com/sursa/api/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE("api/?_c=form&_a=get&id=$id");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print("rep: ${rep.data}");

      //box.write("user", rep.body);
      Get.back();
      //Get.snackbar("Succès", "La mise à jour éffectué");
      Get.to(Details(jsonDecode(rep.data)));
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
      "/api/?_c=agence&_a=select",
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
      "/api/?_c=poste&_a=select",
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
    //  "rep:  https://www.sky-workspace.com/sursa/api/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "api/?_c=form&_a=update&id=$id&id_valid=$id_user&date_valid=$date_valid&etat_valid=$etat_valid",
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
    print("api/?_c=user&_a=forgot&email=$email");
    //print(
    //  "rep:  https://www.sky-workspace.com/sursa/api/?_c=form&_a=get&id=$id");
    d.Response rep = await requete.getE(
      "api/?_c=user&_a=forgot&email=$email",
    );
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      // print("rep: ${rep.statusCode} == $id == $id_user");
      print("rep: ${rep.data}");

      //box.write("user", rep.body);

      Get.back();
      Get.snackbar("Succès",
          "Un email a été envoyé dans votre compte pour reeinitialiser votre mot de passe");
      //Get.to(Details(jsonDecode(rep.data)));
    } else {
      print("rep: ${rep.data}");
      //Get.back();
      Get.snackbar("Erreur", "Un problème lors de la vérification");
    }
  }
  //
}
