import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile/utils/app_controller.dart';

class Profil extends StatefulWidget {
  Map? e;
  Profil() {
    var box = GetStorage();
    e = box.read("user") ?? {};
    //

    //
    print(e);
  }
  //
  @override
  State<StatefulWidget> createState() {
    return _Profil();
  }
}

class _Profil extends State<Profil> {
  //
  RxList l = [].obs;
  //
  RxInt frontier = RxInt(1);
  //////
  RxList agences = [].obs;
  //
  RxInt agence = 1.obs;
  //
  RxBool arrierePlan = false.obs;
  //
  var box = GetStorage();
  //
  AppController appController = Get.find();
  RxBool vuePwd = false.obs;
  //
  @override
  void initState() {
    //
    arrierePlan.value = box.read("arrierePlan") ?? false;
    //
    super.initState();
    //
    frontier.value = int.parse("${widget.e!['id_poste']}");
    agence.value = int.parse("${widget.e!['id_ets']}");
  }

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
          appBar: AppBar(
            title: const Text("SURSA"),
            backgroundColor: Colors.red.shade900,
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              Container(
                alignment: Alignment.center,
                height: 110,
                width: 200,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 50,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "Nom",
                ),
                subtitle: Text(
                  "${widget.e!['nom']}",
                ),
                // trailing: IconButton(
                //   onPressed: () {
                //     //
                //     var nom = TextEditingController();
                //     //
                //     //modifierInfo(e, context, nom, "nom");
                //   },
                //   icon: const Icon(Icons.edit),
                // ),
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: const Text("Téléphone"),
                subtitle: Text("${widget.e!['telephone']}"),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: Text("${widget.e!['email']}"),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("profil"),
                subtitle: Text("${widget.e!['profil']}"),
              ),
              // ListTile(
              //   leading: Icon(Icons.info_outline),
              //   title: Text("Statut"),
              //   subtitle: Text("${widget.e!['statut']}"),
              //   trailing: Switch(
              //     value: true,
              //     onChanged: (e) {
              //       //
              //     },
              //   ),
              // ),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text("agence"),
                subtitle: FutureBuilder(
                  future: appController.getAgence(),
                  builder: (c, t) {
                    if (t.hasData) {
                      //
                      List ll = t.data as List;
                      agences = ll.obs;
                      Map e = {};
                      ll.forEach((element) {
                        if (element['id'] == "${agence.value}") {
                          e = element;
                        }
                      });
                      //print("la liste de trucs2: $l");
                      return Container(
                        alignment: Alignment.centerLeft,
                        height: 48,
                        child: Text(
                          "${e['lib'] ?? ''}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                      //
                      return Obx(
                        () => DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            isExpanded: true,
                            onChanged: (c) {
                              //
                              agence.value = c as int;
                            },
                            value: frontier.value,
                            items: List.generate(agences.length, (index) {
                              Map e = agences[index];
                              return DropdownMenuItem(
                                value: index,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text.rich(
                                    TextSpan(
                                      text: "${e['lib']}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // children: [
                                      //   TextSpan(
                                      //     text:
                                      //         "Province: ${e['province']}",
                                      //     style: const TextStyle(
                                      //         fontSize:
                                      //             13,
                                      //         fontWeight:
                                      //             FontWeight
                                      //                 .bold),
                                      //   ),
                                      // ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    } else if (t.hasError) {
                      return Container();
                    }
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.airplane_ticket),
                title: Text("Post frontalier"),
                subtitle: FutureBuilder(
                  future: appController.getPosteFrontalier(),
                  builder: (c, t) {
                    if (t.hasData) {
                      //
                      List ll = t.data as List;
                      l = ll.obs;
                      //
                      Map e = l[0];
                      //
                      print("la liste de trucs2: $l");
                      //
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "${e['lib']},\n",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "${e['province']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                      // return Obx(
                      //   () => DropdownButtonHideUnderline(
                      //     child: DropdownButton<int>(

                      //       onChanged: (c) {
                      //         //
                      //         int r = c as int;
                      //         //
                      //         frontier.value = l[r]['id'];
                      //       },
                      //       iconSize: 0,
                      //       value: frontier.value,
                      //       isExpanded: true,
                      //       items: List.generate(l.length,
                      //           (index) {
                      //         Map e = l[index];
                      //         return DropdownMenuItem(

                      //           value: index,
                      //           child: Padding(
                      //             padding:
                      //                 const EdgeInsets.all(5),
                      //             child: ,
                      //           ),
                      //         );
                      //       }),
                      //     ),
                      //   ),
                      // );
                    } else if (t.hasError) {
                      return Container();
                    }
                    return Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.remove_red_eye,
              //     color: Colors.grey.shade500,
              //   ),
              //   title: Text("Mot de passe"),
              //   subtitle: ElevatedButton(
              //     onPressed: () async {
              //       //
              //       Get.dialog(
              //         Container(
              //           height: 40,
              //           width: 40,
              //           alignment: Alignment.center,
              //           child: const CircularProgressIndicator(),
              //         ),
              //       );
              //       //
              //       appController.mdpModifier("${widget.e!['id']}");
              //     },
              //     style: ButtonStyle(
              //       fixedSize: MaterialStateProperty.all(
              //         const Size(
              //           double.maxFinite,
              //           45,
              //         ),
              //       ),
              //       shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       )),
              //       backgroundColor:
              //           MaterialStateProperty.all(Colors.red.shade900),
              //     ),
              //     child: const Text("Modifier"),
              //   ),
              //   // subtitle: vuePwd.value
              //   //     ? Text(widget.e!["pwd"])
              //   //     : const Text("************"),
              //   // trailing: IconButton(
              //   //   icon: Icon(Icons.edit),

              //   //   onPressed: () {
              //   //     var postnom = TextEditingController();
              //   //     //
              //   //     modifierInfo(widget.e!, context, postnom, "pwd");
              //   //   },
              //   // ),
              // ),

              Obx(
                () => SwitchListTile(
                  title: const Text("Arrière plan"),
                  subtitle: const Text("Activer ou désactiver l'arrière plan"),
                  value: arrierePlan.value,
                  onChanged: (e) {
                    arrierePlan.value = e;
                    box.write("arrierePlan", arrierePlan.value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom] ?? '';
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: 'nom'.tr,
                        labelText: 'nom'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'nom_message'.tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        //Mise à jour ici...
                        Get.dialog(
                          Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        appController.miseAjour(e);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
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
    );
  }
}
