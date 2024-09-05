import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sursa_mobile/pages/scan.dart';
import 'package:sursa_mobile/utils/app_controller.dart';

import 'details.dart';

class Scanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Scanner();
  }
}

class _Scanner extends State<Scanner> {
  //final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var box = GetStorage();
  //
  AppController appController = Get.find();
  //
  Map agent = {};
  //
  RxList l = [].obs;
  //
  RxInt frontier = RxInt(1);
  //////
  RxList agences = [].obs;
  //
  RxInt agence = 1.obs;
  //

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    agent = box.read('user') ?? {};
    /**
     * agent['id_poste'].runtimeType == String
        ? RxInt(agent['id_poste'])
        : 
     */

    frontier.value = int.parse("${agent['id_poste'] ?? 0}"); //int.parse(
    agence.value = int.parse("${agent['id_ets'] ?? 0}"); //int.parse(
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red.shade100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Nom de l'agent",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          // decoration: BoxDecoration(

                          // ),
                          child: Text(
                            "${agent['nom']}",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Agence",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //width: Get.size.width / 2.1,
                                decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    // border: Border.all(
                                    //   color: Colors.black,
                                    // ),
                                    ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${agent['lib_ets'] ?? ''}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: Get.size.height / 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Poste frontalier",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //width: Get.size.width / 2.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "${agent['lib_poste']},\n",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "${agent['province']}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Expanded(
                //       flex: 4,
                //       child:
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       flex: 4,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: Colors.blue.shade100.withOpacity(0.3),
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: SizedBox(
                //           height: Get.size.height / 9,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SizedBox(
                //                 height: Get.size.height / 9,
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     const Padding(
                //                       padding: EdgeInsets.only(),
                //                       child: Align(
                //                         alignment: Alignment.centerLeft,
                //                         child: Text(
                //                           "Agence",
                //                           style: TextStyle(
                //                             color: Colors.black,
                //                             fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     const SizedBox(
                //                       height: 10,
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(),
                //                       child: Align(
                //                         alignment: Alignment.centerLeft,
                //                         child: Container(
                //                           width: Get.size.width / 2.1,
                //                           decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             border: Border.all(
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                           child: FutureBuilder(
                //                             future: appController.getAgence(),
                //                             builder: (c, t) {
                //                               if (t.hasData) {
                //                                 //
                //                                 List ll = t.data as List;
                //                                 agences = ll.obs;
                //                                 Map e = {};
                //                                 ll.forEach((element) {
                //                                   if (element['id'] ==
                //                                       agence.value) {
                //                                     e = element;
                //                                   }
                //                                 });
                //                                 //print("la liste de trucs2: $l");
                //                                 return Container(
                //                                   alignment: Alignment.center,
                //                                   height: 48,
                //                                   child:
                //                                       Text("${e['lib'] ?? ''}"),
                //                                 );
                //                                 //
                //                                 return Obx(
                //                                   () =>
                //                                       DropdownButtonHideUnderline(
                //                                     child: DropdownButton<int>(
                //                                       isExpanded: true,
                //                                       onChanged: (c) {
                //                                         //
                //                                         agence.value = c as int;
                //                                       },
                //                                       value: frontier.value,
                //                                       items: List.generate(
                //                                           agences.length,
                //                                           (index) {
                //                                         Map e = agences[index];
                //                                         return DropdownMenuItem(
                //                                           value: index,
                //                                           child: Padding(
                //                                             padding:
                //                                                 EdgeInsets.all(
                //                                                     10),
                //                                             child: Text.rich(
                //                                               TextSpan(
                //                                                 text:
                //                                                     "${e['lib']}",
                //                                                 style:
                //                                                     const TextStyle(
                //                                                   fontSize: 13,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .bold,
                //                                                 ),
                //                                                 // children: [
                //                                                 //   TextSpan(
                //                                                 //     text:
                //                                                 //         "Province: ${e['province']}",
                //                                                 //     style: const TextStyle(
                //                                                 //         fontSize:
                //                                                 //             13,
                //                                                 //         fontWeight:
                //                                                 //             FontWeight
                //                                                 //                 .bold),
                //                                                 //   ),
                //                                                 // ],
                //                                               ),
                //                                             ),
                //                                           ),
                //                                         );
                //                                       }),
                //                                     ),
                //                                   ),
                //                                 );
                //                               } else if (t.hasError) {
                //                                 return Container();
                //                               }
                //                               return Container(
                //                                 height: 40,
                //                                 width: 40,
                //                                 alignment: Alignment.center,
                //                                 child:
                //                                     const CircularProgressIndicator(),
                //                               );
                //                             },
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 10,
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.only(),
                //                 child: Align(
                //                   alignment: Alignment.centerLeft,
                //                   child: Text(
                //                     "Poste frantalier",
                //                     style: TextStyle(
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 5,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(),
                //                 child: Align(
                //                   alignment: Alignment.centerLeft,
                //                   child: Container(
                //                     width: Get.size.width / 2.1,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       border: Border.all(
                //                         color: Colors.black,
                //                       ),
                //                     ),
                //                     child: FutureBuilder(
                //                       future:
                //                           appController.getPosteFrontalier(),
                //                       builder: (c, t) {
                //                         if (t.hasData) {
                //                           //
                //                           List ll = t.data as List;
                //                           l = ll.obs;
                //                           print("la liste de trucs2: $l");
                //                           //
                //                           return Obx(
                //                             () => DropdownButtonHideUnderline(
                //                               child: DropdownButton<int>(
                //                                 onChanged: (c) {
                //                                   //
                //                                   int r = c as int;
                //                                   //
                //                                   frontier.value = l[r]['id'];
                //                                 },
                //                                 value: frontier.value,
                //                                 items: List.generate(l.length,
                //                                     (index) {
                //                                   Map e = l[index];
                //                                   return DropdownMenuItem(
                //                                     value: index,
                //                                     child: Padding(
                //                                       padding:
                //                                           const EdgeInsets.all(
                //                                               10),
                //                                       child: Text.rich(
                //                                         TextSpan(
                //                                           text: "${e['lib']}\n",
                //                                           style:
                //                                               const TextStyle(
                //                                             fontSize: 13,
                //                                             fontWeight:
                //                                                 FontWeight.bold,
                //                                           ),
                //                                           children: [
                //                                             TextSpan(
                //                                               text:
                //                                                   "Province: ${e['province']}",
                //                                               style: const TextStyle(
                //                                                   fontSize: 13,
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .bold),
                //                                             ),
                //                                           ],
                //                                         ),
                //                                       ),
                //                                     ),
                //                                   );
                //                                 }),
                //                               ),
                //                             ),
                //                           );
                //                         } else if (t.hasError) {
                //                           return Container();
                //                         }
                //                         return Container(
                //                           height: 40,
                //                           width: 40,
                //                           alignment: Alignment.center,
                //                           child:
                //                               const CircularProgressIndicator(),
                //                         );
                //                       },
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 100,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    //
                    Get.to(QRViewExample());
                    //
                    //appController.scannerTest();
                    //
                    // String? barcodeScanRes =
                    //  await FlutterBarcodeScanner.scanBarcode(
                    //    "red", "Quitter", true, ScanMode.QR);
                    // Get.to(Details(barcodeScanRes));
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(
                        double.maxFinite,
                        45,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade900),
                  ),
                  child: const Text(
                    "Commencer le scanne",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    //controller?.dispose();
    super.dispose();
  }
}
