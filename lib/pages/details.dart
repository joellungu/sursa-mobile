import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sursa_mobile/utils/app_controller.dart';
import 'package:sursa_mobile/utils/requete.dart';

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
              infos!['nom'] != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: 45,
                        //   alignment: Alignment.center,
                        //   child: ToggleButtons(
                        //     isSelected: [true, false],
                        //     onPressed: (t) {
                        //       //
                        //     },
                        //     selectedColor: Colors.black,
                        //     fillColor: Colors.grey.shade200,
                        //     borderRadius: BorderRadius.circular(15),
                        //     textStyle: const TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15,
                        //     ),
                        //     children: const [
                        //       Text("  Conforme "),
                        //       Text(" Non Conforme  "),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 5,
                                      color: Colors.lightBlue.shade300,
                                    ),
                                    const Text("Informations du passager"),
                                    IconButton(
                                      onPressed: () {
                                        Get.dialog(
                                          Material(
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Container(
                                                height: Get.size.height / 1.7,
                                                width: Get.size.width / 1.1,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        height: 40,
                                                        width: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.white,
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height:
                                                            Get.size.height /
                                                                1.5,
                                                        width: Get.size.width /
                                                            1.3,
                                                        child: PhotoView(
                                                          backgroundDecoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          imageProvider:
                                                              NetworkImage(
                                                                  "${Requete.url}/img/avatar/${infos!['id']}.jpg"),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.person),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blue.shade700),
                                      ),
                                      child: ListTile(
                                        title: const Text(
                                          "Moyen de transport",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        subtitle:
                                            Text("${infos!['voie_transport']}"),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(2),
                                    height: 50,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.red.shade700)),
                                      child: ListTile(
                                        title: const Text(
                                          "Mouvement",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        subtitle: Text("${infos!['mvt']}"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              //champ("Voie de transport ", "${infos!['voie_transport']}",
                              //  Icons.menu),
                              Expanded(
                                flex: 1,
                                child: ListView(
                                  padding: const EdgeInsets.all(0),
                                  children: [
                                    const Divider(),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        //color: Colors.red.shade100.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Informations personnelles",
                                              style: TextStyle(
                                                color: Colors.teal.shade900,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          champ("Nom", "${infos!['nom']}",
                                              "ICON SURSA HD15"),
                                          champ(
                                              "Postnom",
                                              "${infos!['postnom']}",
                                              "ICON SURSA HD15"),
                                          champ("Prénom", "${infos!['prenom']}",
                                              "ICON SURSA HD15"),
                                          //champ("Lieu de naissance", "${infos!['nom']}",
                                          //  Icons.location_on),
                                          champ(
                                              "Date naissance",
                                              getDate("${infos!['date_nais']}"),
                                              "ICON SURSA HD21"),
                                          champ(
                                              "Sexe",
                                              infos!['sexe'] == "M"
                                                  ? 'Homme'
                                                  : 'Femme',
                                              "ICON SURSA HD18"),
                                          champ("Taille", "${infos!['taille']}",
                                              "ICON SURSA HD18"),
                                          champ("Poids", "${infos!['poids']}",
                                              "ICON SURSA HD32"),
                                          champ(
                                              "Nationalité",
                                              "${infos!['nationalite']}",
                                              "ICON SURSA HD23"),
                                          infos!['mvt'] != "Circulant"
                                              ? champ(
                                                  "Pays d'origine",
                                                  "${infos!['pays_origine']}",
                                                  "ICON SURSA HD24")
                                              : Container(),
                                          champ(
                                              "Numéro passeport",
                                              "${infos!['num_passeport']}",
                                              "ICON SURSA HD30"),

                                          champ("Email", "${infos!['email']}",
                                              "ICON SURSA HD19"),
                                          champ(
                                              "Numéro téléphone",
                                              "${infos!['telephone']}",
                                              "ICON SURSA HD20"),
                                          //

                                          champ(
                                              "Adresse ",
                                              "${infos!['adresse']}",
                                              "ICON SURSA HD20"),
                                        ],
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        //color: Colors.grey.shade700,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Itinéraire & localisation",
                                              style: TextStyle(
                                                color: Colors.teal.shade900,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          champ(
                                              "Date et heure d'enregistrement",
                                              getDate(
                                                  "${infos!['date_creat']}"),
                                              "ICON SURSA HD26"),

                                          champ(
                                              "Date d'arrivée",
                                              getDate(infos!['date_arrivee']),
                                              "ICON SURSA HD25"),

                                          infos!['mvt'] == "Entrant"
                                              ? champ(
                                                  "Dernier pays visité",
                                                  "${infos!['pays_visite'] ?? ''}",
                                                  "ICON SURSA HD6")
                                              : Container(),

                                          // infos!['mvt'] == "Entrant"
                                          //     ? champ(
                                          //         "Province destination",
                                          //         "${infos!['province_dest'] ?? ''}",
                                          //         Icons.calendar_today)
                                          //     : Container(),

                                          infos!['mvt'] == "Sortant"
                                              ? champ(
                                                  "Province actuelle",
                                                  "${infos!['province_actuel'] ?? ''}",
                                                  "ICON SURSA HD6")
                                              : Container(),

                                          infos!['mvt'] == "Sortant"
                                              ? champ(
                                                  "Pays destination",
                                                  "${infos!['pays_dest'] ?? ''}",
                                                  "ICON SURSA HD6")
                                              : Container(),
//////
                                          infos!['mvt'] == "Circulant"
                                              ? champ(
                                                  "Province actuelle",
                                                  "${infos!['province_actuel'] ?? ''}",
                                                  "ICON SURSA HD6")
                                              : Container(),
                                          infos!['mvt'] == "Circulant"
                                              ? champ(
                                                  "Ville destination",
                                                  "${infos!['ville_destination'] ?? ''}",
                                                  "ICON SURSA HD5")
                                              : Container(),

                                          infos!['mvt'] == "Circulant" ||
                                                  infos!['mvt'] == "Entrant"
                                              ? champ(
                                                  "Province de destination",
                                                  "${infos!['province_dest'] ?? ''}",
                                                  "ICON SURSA HD5")
                                              : Container(),

                                          infos!['mvt'] == "Circulant"
                                              ? champ(
                                                  "Ville de actuelle",
                                                  "${infos!['ville_dest'] ?? ''}",
                                                  "ICON SURSA HD5")
                                              : Container(),

                                          champ(
                                            infos!['voie_transport'] ==
                                                    "Voie terrestre"
                                                ? "Compagnie routière"
                                                : infos!['voie_transport'] ==
                                                        "Voie maritime"
                                                    ? "Compagnie maritime"
                                                    : "Compagnie aérienne",
                                            "${infos!['compagnie']}",
                                            infos!['voie_transport'] ==
                                                    "Voie terrestre"
                                                ? "ICON SURSA HD27"
                                                : infos!['voie_transport'] ==
                                                        "Voie maritime"
                                                    ? "ICON SURSA HD28"
                                                    : "ICON SURSA HD",
                                          ),

                                          champ(
                                              "Numéro de vol",
                                              "${infos!['num_vol']}",
                                              "ICON SURSA HD3"),
                                          champ(
                                              "Numéro de siège",
                                              "${infos!['num_siege']}",
                                              "ICON SURSA HD4"),
                                          //
                                          champ(
                                              "Nom de la personne-ressource (le plus proche parent)",
                                              "${infos!['personne_urgence']}",
                                              "ICON SURSA HD16"),

                                          champ(
                                              "Numéro de téléphone de la personne à contacter en cas d'urgence",
                                              "${infos!['contact_urgence']}",
                                              "ICON SURSA HD20"),
                                          // champ("Date d'enregistrement",
                                          //     "${infos!['date_creat']}", Icons.hotel),
                                          // champ("Sous-location/Domaine ", "${infos!['nom']}",
                                          //     Icons.hotel),
                                        ],
                                      ),
                                    ),

                                    //////////////////////////////////////////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        //color: Colors.teal.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Informations sanitaires",
                                              style: TextStyle(
                                                color: Colors.teal.shade900,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          champ(
                                              "Fièvre",
                                              infos!['fievre'] == 1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD9"),
                                          champ(
                                              "Sensation Fievre",
                                              infos!['sensation_fievre'] == 1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD10"),
                                          champ(
                                              "PCR Covid19",
                                              infos!['test_covid'] == 1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD11"),
                                          champ(
                                              "Toux",
                                              infos!['toux'] == 1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD12"),
                                          champ(
                                              "Symptômes",
                                              infos!['symptomes'] == ''
                                                  ? 'RAS'
                                                  : '${infos!['symptomes']}',
                                              "ICON SURSA HD13"),
                                          champ(
                                              "Difficulté à respirer ",
                                              infos!['difficulte_respiratoire'] ==
                                                      1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD14"),
                                          champ(
                                              "Assurance Maladie",
                                              infos!['assurance_maladie'] == 1
                                                  ? 'Oui'
                                                  : 'Non',
                                              "ICON SURSA HD29"),
                                        ],
                                      ),
                                    ),
                                    //////////////////////////////////////////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // champ("Ville de destination",
                                    //     "${infos!['destination']}", Icons.location_on),

                                    // champ(
                                    //     "Température corporelle",
                                    //     infos!['fievre'] == 1 ? 'Oui' : 'Non',
                                    //     Icons.thermostat),
                                    // champ("Maux", "${infos!['nom']}", Icons.sick),

                                    //champ("Adresse postale ", "${infos!['nom']}", Icons.hotel),
                                    /**
                     * infos!['id_valid'] = "${user['id']}"; //
                                infos!['date_valid'] = "$dateTime";
                                infos!['etat_valid']
                     */
                                    infos!['id_valid'] == null ||
                                            infos!['date_valid'] == null ||
                                            infos!['etat_valid'] == null
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 30,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.dialog(
                                                        const Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Center(
                                                            child: SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                      //

                                                      var box = GetStorage();
                                                      Map user =
                                                          box.read("user");
                                                      //
                                                      DateTime dateTime =
                                                          DateTime.now();
                                                      //
                                                      print(
                                                          "rep: ${user['id']}");
                                                      //
                                                      infos!['id_valid'] =
                                                          "${user['id']}"; //
                                                      infos!['date_valid'] =
                                                          "$dateTime";
                                                      infos!['etat_valid'] =
                                                          "conforme";
                                                      //
                                                      appController.validation(
                                                          "${infos!['id']}",
                                                          "${user['id']}",
                                                          "$dateTime",
                                                          "conforme");
                                                      //
                                                    },
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all(
                                                        const Size(
                                                          double.maxFinite,
                                                          45,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.green
                                                                  .shade700),
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    child:
                                                        const Text("CONFORME"),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Get.dialog(
                                                        const Material(
                                                          color: Colors
                                                              .transparent,
                                                          child: Center(
                                                            child: SizedBox(
                                                              height: 40,
                                                              width: 40,
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                      //

                                                      //
                                                      var box = GetStorage();
                                                      Map user =
                                                          box.read("user");
                                                      //
                                                      DateTime dateTime =
                                                          DateTime.now();
                                                      //
                                                      infos!['id_valid'] =
                                                          "${user['id']}"; //
                                                      infos!['date_valid'] =
                                                          "$dateTime";
                                                      infos!['etat_valid'] =
                                                          "non conforme";
                                                      //
                                                      appController.validation(
                                                          "${infos!['id']}",
                                                          "${user['id']}",
                                                          "$dateTime",
                                                          "non conforme");
                                                      //
                                                      //
                                                    },
                                                    style: ButtonStyle(
                                                      fixedSize:
                                                          MaterialStateProperty
                                                              .all(
                                                        Size(
                                                          double.maxFinite,
                                                          45,
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.red
                                                                  .shade700),
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "NON CONFORME",
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            child: Text.rich(
                                              TextSpan(
                                                text: "ATTENTION \n",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.red.shade900),
                                                children: [
                                                  const TextSpan(
                                                    text:
                                                        "Formulaire déjà certifié\n",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "${infos!['etat_valid']}"
                                                            .capitalize,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.blue.shade900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
    );
  }

  Widget champ(String titre, String valeur, String ic, {bool svg = false}) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: svg ? Icon(Icons.abc) : Container(),
        decoration: svg
            ? BoxDecoration(color: Colors.transparent)
            : BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/$ic.png"),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
      ),
      title: Text(
        titre,
        style: TextStyle(
          fontSize: 17,
          color: Colors.red.shade900,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        valeur.toUpperCase(),
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }

  String getDate(String date) {
    List ds = date.split("-");
    String dh1 = "";
    String dh2 = "";
    print("ds: ${ds[2]}");
    if ("${ds[2]}".length > 2) {
      List l = "${ds[2]}".split(" ");
      //List l2 = "${l[1]}".split(":");
      //dh2 = "${l2[0]}h : ${l2[1]}min : ${l2[2]}s";
      dh2 = "${l[1]}";
      dh1 = "${l[0]}";
    } else {
      dh1 = "${ds[2]}";
    }
    List mois = [
      "",
      "JANVIER",
      "FEVRIER",
      "MARS",
      "AVRIL",
      "MAI",
      "JUIN",
      "JUILLET",
      "AOÛT",
      "SEPTEMBRE",
      "ACTOBRE",
      "NOVEMBRE",
      "DECEMBRE",
    ];

    return "$dh1 ${mois[int.parse(ds[1])]} ${ds[0]} $dh2";
  }
}
