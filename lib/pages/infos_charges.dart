import 'package:flutter/material.dart';

class InfosCharges extends StatelessWidget {
  //
  List charges = [];
  //
  InfosCharges(this.charges);
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: const EdgeInsets.all(10),
      children: List.generate(charges.length, (index) {
        //
        Map infos = charges[index];
        //
        return Column(
          children: [
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
                      "Mineur ${index + 1}",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  champ("Nom", "${infos!['nom']}", "ICON SURSA HD15"),
                  champ("Postnom", "${infos!['postnom']}", "ICON SURSA HD15"),
                  champ("Prénom", "${infos!['prenom']}", "ICON SURSA HD15"),
                  champ("Sexe", infos!['sexe'] == "M" ? 'Homme' : 'Femme',
                      "ICON SURSA HD18"),
                  //champ("Taille", "${infos!['taille']}", "ICON SURSA HD32"),
                  //champ("Poids", "${infos!['poids']}", "ICON SURSA HD31"),
                  //champ("Nationalité", "${infos!['nationalite']}",
                  //  "ICON SURSA HD23"),
                  //
                  champ("Lien de parenté", "${infos!['lien_parente']}",
                      "ICON SURSA HD23"),
                  champ("Type identité", "${infos!['lib_identite']}",
                      "ICON SURSA HD23"),
                  champ("Numéro d'identité", "${infos!['num_identite']}",
                      "ICON SURSA HD23"),
                  //
                  //champ("Date naissance", getDate("${infos!['date_nais']}"),
                  //  "ICON SURSA HD21"),
                  // infos!['mvt'] != "Circulant"
                  //     ? champ(
                  //         "Pays d'origine",
                  //         "${infos!['pays_origine']}",
                  //         "ICON SURSA HD24")
                  //     : Container(),
                  champ("Numéro passeport", "${infos!['num_identite']}",
                      "ICON SURSA HD30"),
                  //
                  champ("Toux", infos!['toux'] == 1 ? 'Oui' : 'Non',
                      "ICON SURSA HD12"),
                  //
                  champ("Toux", infos!['toux'] == 1 ? 'Oui' : 'Non',
                      "ICON SURSA HD12"),
                  //
                  champ("Grippe", infos!['grippe'] == 1 ? 'Oui' : 'Non',
                      "ICON SURSA HD14"),
                  //
                  champ(
                      "Symptômes",
                      infos!['autres_symptomes'] == ''
                          ? 'RAS'
                          : '${infos!['autres_symptomes']}',
                      "ICON SURSA HD13"),
                  //
                  champ(
                      "Assurance Maladie",
                      infos!['assurance_maladie'] == 1 ? 'Oui' : 'Non',
                      "ICON SURSA HD29"),
                  //
                  champ("Fièvre", infos!['fievre'] == 1 ? 'Oui' : 'Non',
                      "ICON SURSA HD9"),
                  //
                  champ("Email", "${infos!['email']}", "ICON SURSA HD19"),
                  champ("Numéro téléphone", "${infos!['telephone']}",
                      "ICON SURSA HD20"),
                  //
                  champ("Adresse ", "${infos!['adresse']}", "ICON SURSA HD20"),
                ],
              ),
            ),
            //////////////////////////////////////////////////////
            const SizedBox(
              height: 10,
            ),
          ],
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
        decoration: svg
            ? const BoxDecoration(color: Colors.transparent)
            : BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/$ic.png"),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
        child: svg ? const Icon(Icons.abc) : Container(),
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

  //
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
