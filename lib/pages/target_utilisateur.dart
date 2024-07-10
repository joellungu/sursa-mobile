import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TargetUtilisateur extends StatelessWidget {
  List targets;
  //
  TargetUtilisateur(this.targets);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      children: List.generate(targets.length, (index) {
        //
        Map infos = targets[index];
        //
        return InkWell(
          onTap: () {
            //
            Get.dialog(
              Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Divider(),
                            Container(
                              margin: const EdgeInsets.all(2),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                //color: Colors.red.shade100.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
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
                                      "${infos['demandeur']}".toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.teal.shade900,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  champ("result", infos['result'],
                                      "ICON SURSA HD15"),
                                  champ("Nom", "${infos['nom']}",
                                      "ICON SURSA HD15"),
                                  champ(
                                      "Sexe",
                                      infos['sexe'] == "M" ? 'Homme' : 'Femme',
                                      "ICON SURSA HD18"),
                                  champ(
                                      "Numéro téléphone",
                                      "${infos['telephone']}",
                                      "ICON SURSA HD20"),
                                  champ("Email", "${infos!['email']}",
                                      "ICON SURSA HD19"),
                                  champ("Identité", "${infos['identite']}",
                                      "ICON SURSA HD32"),
                                  champ("Procedures", "${infos['procedures']}",
                                      "ICON SURSA HD31"),
                                  champ(
                                      "Nationalité",
                                      "${infos['nationalite']}",
                                      "ICON SURSA HD23"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          child: Column(
            children: [
              const Divider(),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  //color: Colors.red.shade100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${infos['demandeur']}".toUpperCase(),
                        style: TextStyle(
                          color: infos['result'] == "Complète"
                              ? Colors.teal.shade900
                              : Colors.orange.shade900,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // champ("result", infos['result'], "ICON SURSA HD15"),
                    // champ("Nom", "${infos['nom']}", "ICON SURSA HD15"),
                    // champ("Sexe", infos['sexe'] == "M" ? 'Homme' : 'Femme',
                    //     "ICON SURSA HD18"),
                    // champ("Numéro téléphone", "${infos['telephone']}",
                    //     "ICON SURSA HD20"),
                    // champ("Email", "${infos!['email']}", "ICON SURSA HD19"),
                    // champ(
                    //     "Identité", "${infos['identite']}", "ICON SURSA HD32"),
                    champ("Procedures", "${infos['procedures']}",
                        "ICON SURSA HD31"),
                    // champ("Nationalité", "${infos['nationalite']}",
                    //     "ICON SURSA HD23"),
                  ],
                ),
              ),
              //////////////////////////////////////////////////////
            ],
          ),
        );
      }),
    );
  }

  //
  Widget champ(String titre, String valeur, String ic, {bool svg = false}) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: SvgPicture.asset(
          "assets/MaterialSymbolsLightWarningOutlineRounded.svg",
          semanticsLabel: 'Acme Logo',
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
}
