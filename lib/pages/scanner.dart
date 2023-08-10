import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sursa_mobile/pages/scan.dart';

import 'details.dart';

class Scanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Scanner();
  }
}

class _Scanner extends State<Scanner> {
  //final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 5,
              child: Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 250,
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

                    //String? barcodeScanRes =
                    //  await FlutterBarcodeScanner.scanBarcode(
                    //    "red", "Quitter", true, ScanMode.QR);
                    //Get.to(Details(barcodeScanRes));
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
                  child: const Text("Commencer le scanne"),
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
