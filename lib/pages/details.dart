import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sursa_mobile/utils/app_controller.dart';
import 'package:sursa_mobile/utils/requete.dart';

import 'infos_utilisateur.dart';
import 'photo_utilisateur.dart';
import 'target_utilisateur.dart';

class Details extends StatelessWidget {
  String? code;
  //
  var box = GetStorage();
  //
  Map? infos;
  //
  AppController appController = Get.find();
  //
  RxBool arrierePlan = false.obs;
  //
  Details(this.infos) {
    //
    arrierePlan.value = box.read("arrierePlan") ?? false;
    //
    print("conformite: ${infos!['conformite']}");
    //
    print(
        "${arrierePlan.value} ---- ${infos!['id_valid']} =|= ${infos!['date_valid']} =|= ${infos!['etat_valid']} =|= ${infos!['mvt']}");
    // infos = {
    //   "id": 5,
    //   "nom": "BOKETSHU",
    //   "postnom": "BOKOMO",
    //   "prenom": "JOEL",
    //   "sexe": "M",
    //   "date_nais": "1961-07-15",
    //   "date_arrivee": "2023-08-13",
    //   "nationalite": "R\u00e9publique du Congo",
    //   "pays_origine": "Belize",
    //   "num_passeport": "op4552099",
    //   "telephone": "+24309818790577",
    //   "email": "joelbkm@gmail.com",
    //   "voie_transport": "Voie a\u00e9rienne",
    //   "compagnie": "Ethiopian Airlines",
    //   "num_vol": "ET840",
    //   "province_actuel": null,
    //   "province_dest": null,
    //   "num_siege": "24B",
    //   "destination": null,
    //   "pays_visite": null,
    //   "fievre": 1,
    //   "sensation_fievre": 1,
    //   "test_covid": 1,
    //   "toux": 1,
    //   "symptomes": "",
    //   "difficulte_respiratoire": 1,
    //   "assurance_maladie": 1,
    //   "adresse": "Mont ngafula villa 661",
    //   "langue": "",
    //   "poids": "98",
    //   "taille": 166,
    //   "code": "",
    //   "etat": "Actif",
    //   "mvt": null,
    //   "date_creat": "2023-07-29 17:18:41",
    //   "id_valid": null,
    //   "date_valid": null,
    //   "etat_valid": null,
    //   "id_verif": null,
    //   "date_verif": null,
    //   "etat_verif": null,
    //   "noms": "BOKETSHU BOKOMO JOEL",
    //   "avatar": "http:\/\/localhost\/www\/sursa\/img\/avatar\/5.jpg",
    //   "qrcode": "http:\/\/localhost\/www\/sursa\/img\/qrcode\/5.png",
    //   "exp": ""
    // };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Informations du passager"),
              backgroundColor: Colors.red.shade900,
            ),
            body: Stack(
              children: [
                Obx(
                  () => Container(
                    height: double.infinity,
                    width: double.maxFinite,
                    decoration: arrierePlan.value
                        ? const BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("assets/kin.jpg"),
                              fit: BoxFit.cover,
                            ),
                          )
                        : const BoxDecoration(
                            color: Colors.white,
                          ),
                    child: arrierePlan.value
                        ? BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
                infos!['info']['nom'] != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                            child: TabBar(
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                              indicatorColor: Colors.black,
                              tabs: [
                                Tab(
                                  text: "Infos.",
                                ),
                                Tab(
                                  text: "Photos",
                                ),
                                Tab(
                                  text: "Targets",
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TabBarView(
                              children: [
                                InfosUtilisateur(
                                    infos!['info'], infos!['conformite']),
                                PhotoUtilisateur(infos!['a_photo']),
                                TargetUtilisateur(infos!['target']),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Container(
                          height: 100,
                          width: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "Pass sanitaire mal enregistré",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
