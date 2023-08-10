import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile/utils/app_controller.dart';
import 'package:sursa_mobile/utils/requete.dart';

class Details extends StatelessWidget {
  String? code;
  Map? infos;
  //
  AppController appController = Get.find();
  //
  Details(this.infos) {
    print(
        "${infos!['id_valid']} =|= ${infos!['date_valid']} =|= ${infos!['etat_valid']} =|= ${infos!['mvt']}");
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
          body: Column(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 5,
                            color: Colors.lightBlue.shade300,
                          ),
                          const Text("Informations du passager"),
                          IconButton(
                            onPressed: () {
                              Get.dialog(Material(
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
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                          child: Container(
                                            height: Get.size.height / 2,
                                            width: Get.size.width / 1.3,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${Requete.url}/img/avatar/${infos!['id']}.jpg"),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            },
                            icon: Icon(Icons.person),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: ListTile(
                            title: const Text(
                              "Moyen de transport",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("${infos!['voie_transport']}"),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 5,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListTile(
                            title: const Text(
                              "Mouvement",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("${infos!['mvt']}"),
                          ),
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
                          champ("Nom", "${infos!['nom']}", Icons.person),
                          champ(
                              "Postnom", "${infos!['postnom']}", Icons.person),
                          champ("Prénom", "${infos!['prenom']}", Icons.person),
                          //champ("Lieu de naissance", "${infos!['nom']}",
                          //  Icons.location_on),
                          champ("Date naissance", "${infos!['date_nais']}",
                              Icons.calendar_month),
                          champ(
                              "Sexe",
                              infos!['sexe'] == "M" ? 'Homme' : 'Femme',
                              Icons.category),
                          champ("Nationalité", "${infos!['nationalite']}",
                              Icons.language),
                          champ("Pays d'origine", "${infos!['pays_origine']}",
                              Icons.language),
                          champ("Numéro passeport",
                              "${infos!['num_passeport']}", Icons.person),

                          champ("Email", "${infos!['email']}", Icons.email),
                          champ("Numéro téléphone", "${infos!['telephone']}",
                              Icons.numbers),

                          infos!['mvt'] == "Entrant"
                              ? champ(
                                  "Province destination",
                                  "${infos!['province_dest'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),

                          infos!['mvt'] == "Sortant"
                              ? champ(
                                  "Province actuelle",
                                  "${infos!['province_actuel'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),

                          infos!['mvt'] == "Sortant"
                              ? champ(
                                  "Pays destination",
                                  "${infos!['pays_dest'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),
//////
                          infos!['mvt'] == "Circulant"
                              ? champ(
                                  "Province actuelle",
                                  "${infos!['province_actuel'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),

                          infos!['mvt'] == "Circulant"
                              ? champ(
                                  "Province destination",
                                  "${infos!['province_dest'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),

                          infos!['mvt'] == "Circulant"
                              ? champ(
                                  "Ville de destination",
                                  "${infos!['ville_dest'] ?? ''}",
                                  Icons.calendar_today)
                              : Container(),

                          champ("Date d'enregistrement",
                              "${infos!['date_creat']}", Icons.calendar_today),
                          champ("Compagnie aérienne", "${infos!['compagnie']}",
                              Icons.airplane_ticket),
                          //champ(
                          //"Mouvement", "${infos!['mvt']}", Icons.airplane_ticket),
                          champ("Numéro de vol", "${infos!['num_vol']}",
                              Icons.airplane_ticket),
                          champ("Numéro de siège", "${infos!['num_siege']}",
                              Icons.airplane_ticket),
                          champ("Ville de destination",
                              "${infos!['destination']}", Icons.location_on),
                          champ("Pays visités ", "${infos!['pays_visite']}",
                              Icons.location_on),
                          champ(
                              "Température corporelle",
                              infos!['fievre'] == 1 ? 'Oui' : 'Non',
                              Icons.thermostat),
                          champ("Maux", "${infos!['nom']}", Icons.sick),
                          champ("Fièvre", infos!['fievre'] == 1 ? 'Oui' : 'Non',
                              Icons.sick),
                          champ(
                              "Sensation Fievre",
                              infos!['sensation_fievre'] == 1 ? 'Oui' : 'Non',
                              Icons.sick),
                          champ(
                              "PCR Covid19 négatif",
                              infos!['test_covid'] == 1 ? 'Oui' : 'Non',
                              Icons.coronavirus),
                          champ("Toux", infos!['toux'] == 1 ? 'Oui' : 'Non',
                              Icons.sick),
                          champ("Symptomes", "${infos!['symptomes']}",
                              Icons.sick),
                          champ(
                              "Difficulté à respirer ",
                              infos!['difficulte_respiratoire'] == 1
                                  ? 'Oui'
                                  : 'Non',
                              Icons.air),
                          champ(
                              "Assurance Maladie ",
                              infos!['assurance_maladie'] == 1 ? 'Oui' : 'Non',
                              Icons.air),

                          champ(
                              "Nom de la personne-ressource (le plus proche parent)",
                              "${infos!['nom']}",
                              Icons.person),

                          champ(
                              "Numéro de téléphone de la personne à contacter",
                              "${infos!['nom']}",
                              Icons.numbers),
                          champ("Village/Numéro de maison/Hôtel",
                              "${infos!['nom']}", Icons.hotel),
                          champ("Sous-location/Domaine ", "${infos!['nom']}",
                              Icons.hotel),
                          champ(
                              "Adresse ", "${infos!['adresse']}", Icons.hotel),
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
                                              Material(
                                                color: Colors.transparent,
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
                                            Map user = box.read("user");
                                            //
                                            DateTime dateTime = DateTime.now();
                                            //
                                            print("rep: ${user['id']}");
                                            //
                                            infos!['id_valid'] =
                                                "${user['id']}"; //
                                            infos!['date_valid'] = "$dateTime";
                                            infos!['etat_valid'] = "conforme";
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
                                                MaterialStateProperty.all(
                                              const Size(
                                                double.maxFinite,
                                                45,
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.green.shade700),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          child: const Text("CONFORME"),
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
                                                color: Colors.transparent,
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
                                            Map user = box.read("user");
                                            //
                                            DateTime dateTime = DateTime.now();
                                            //
                                            infos!['id_valid'] =
                                                "${user['id']}"; //
                                            infos!['date_valid'] = "$dateTime";
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
                                                MaterialStateProperty.all(
                                              Size(
                                                double.maxFinite,
                                                45,
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red.shade700),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          child: const Text("NON COONFORME"),
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
                                          fontWeight: FontWeight.normal,
                                          color: Colors.red.shade900),
                                      children: [
                                        const TextSpan(
                                          text: "Formumaire déjà certifié\n",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "${infos!['etat_valid']}"
                                              .capitalize,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade900,
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
          ),
        ),
      ),
    );
  }

  Widget champ(String titre, String valeur, IconData ic) {
    return ListTile(
      leading: Icon(
        ic,
        size: 40,
      ),
      title: Text(
        titre,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      ),
      subtitle: Text(
        valeur,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }
}
