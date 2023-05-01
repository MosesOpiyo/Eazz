// ignore_for_file: avoid_print, must_be_immutable

import 'package:eazz/HomePage/homepage.dart';
import 'package:eazz/Models/Receipts/single_receipt_model.dart';
import 'package:eazz/Services/Receipt/receipt_service.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.receiptNumber});
  final int receiptNumber;
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late SingleReceiptResponseModel receipt;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    ReceiptService().getReceipt(widget.receiptNumber).then((value) => {
          print(value),
          setState(() {
            receipt = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.all(10),
          width: 100,
          height: 40,
          child: const Text(
            "Checkout",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 300,
        height: 40,
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(255, 76, 0, 2)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: Color.fromRGBO(255, 76, 0, 2))))),
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('The receipt will be saved under Receipts.'),
              action: SnackBarAction(
                label: 'Okay',
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.topToBottom,
                          duration: const Duration(milliseconds: 500),
                          child: const HomePage()));
                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Checkout'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: FutureBuilder(
        future: ReceiptService().getReceipt(widget.receiptNumber),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "Cashier: ${receipt.serverName}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "Store: ${receipt.storeName}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10),
                                    child: Text(
                                      "Items: ${receipt.items?.length}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Oswald',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 250,
                    padding: EdgeInsets.zero,
                    child: Container(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: Text(
                                    "Products",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 99, 99, 99),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: receipt.items?.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      receipt.items![index].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontFamily: 'Oswald',
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          "item Number:",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Oswald',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: Text(
                                                            receipt
                                                                .items![index]
                                                                .itemNumber
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Oswald',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  "Price: Ksh ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontFamily: 'Oswald',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  receipt.items![index].price
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Oswald',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ));
                                      },
                                    ))),
                          ],
                        )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 120,
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: const Text(
                                  "SubTotal:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: const Text(
                                  "Tax:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: const Text(
                                  "Total:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    "Ksh ${receipt.receiptTotal}.00",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: const Text(
                                    "Ksh 25.00",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 20),
                                  child: Text(
                                    "Ksh ${receipt.receiptTotal}.00",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            );
          } else {
            return const Text('');
          }
        },
      )),
    );
  }
}
