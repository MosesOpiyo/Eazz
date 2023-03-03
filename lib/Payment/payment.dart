// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:eazz/Models/Receipts/receipt_models.dart';
import 'package:eazz/Models/Receipts/single_receipt_model.dart';
import 'package:eazz/Payment/checkout.dart';
import 'package:eazz/Services/Receipt/receipt_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey _globalKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  int counter = 0;

  void qrCode(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      counter++;
      if (counter == 1) {
        setState(() {
          controller.pauseCamera();
          result = scanData;
          ReceiptService().postReceipt(result!.code);

          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                  child: const Checkout()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.all(10),
          width: 70,
          height: 40,
          child: const Text(
            "Scan",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald',
                color: Colors.black),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(255, 76, 0, 2),
                  ),
                  height: 120,
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: const Text("Scan QR Code",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const Text(
                            "Scan the QR code to complete purchase of your products.",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    ),
                  ),
                )),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: size.height * 0.6,
                    width: size.width,
                    padding: EdgeInsets.zero,
                    child: QRView(
                      key: _globalKey,
                      onQRViewCreated: qrCode,
                      overlay: QrScannerOverlayShape(
                          borderLength: 10,
                          borderWidth: 20,
                          borderRadius: 10,
                          cutOutSize: MediaQuery.of(context).size.width * .8),
                    ))),
          ),
        ],
      )),
    );
  }
}
