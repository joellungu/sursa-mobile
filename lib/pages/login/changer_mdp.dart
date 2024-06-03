import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_mobile/pages/accueil.dart';
import 'package:sursa_mobile/utils/app_controller.dart';
import 'login_controller.dart';

class ChangeCode extends StatelessWidget {
  //
  final formKey = GlobalKey<FormState>();
  final code = TextEditingController();
  final mdp = TextEditingController();
  String email;
  String token;
  //
  ChangeCode(this.email, this.token);
  //
  RxBool vue = true.obs;

  AppController appController = Get.find();
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900, // Status bar color

      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.red.shade900,
            //backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage("assets/logo_MIN SANTE.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   "assets/logo_MIN SANTE.png",
                    //   width: 300,
                    //   height: 300,
                    // ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Veuillez saisire le code envoyé dans votre email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: code,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Saisissez nouveau mot de passe";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Saisissez nouveau mot de passe",
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //Get.off(Accueil());

                          Get.dialog(
                            Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                          );

                          // Timer(Duration(seconds: 3), () {
                          //   Get.back();
                          //   Get.off(Accueil());
                          // });
                          // Map e = {
                          //   "pseudo": email.text,
                          //   "pwd": mdp.text,
                          // };
                          appController.mdpModifier(token, code.text);
                          //loginController.deja.value = true;
                        }
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          const Size(
                            double.maxFinite,
                            45,
                          ),
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade900),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        child: const Text("Envoyer"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: InputDecorator(
                    //     decoration: InputDecoration(
                    //       labelText: 'XP',
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //       ),
                    //     ),
                    //     child: Text('content goes here'),
                    //   ),
                    // )
                  ],
                ),
                //)
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 70,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/LOGO SURSA TTRANSPARENT.png",
              width: 70,
              height: 70,
            ),
          ),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     text: "Power by\n",
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: "SkyTechnologie",
          //         style: TextStyle(
          //           color: Colors.grey.shade700,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
