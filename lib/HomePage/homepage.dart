import 'package:eazz/Menu/menu.dart';
import 'package:eazz/MyCode/mycode.dart';
import 'package:eazz/Payment/payment.dart';
import 'package:eazz/Receipts/receipts.dart';
import 'package:eazz/Services/User/user_service.dart';
import 'package:eazz/Transfer/transfer.dart';
import 'package:eazz/WithDraw/withdraw.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var time = DateTime.now();
    List months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    var currentMon = time.month;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 76, 0, 2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const Menu()));
            },
            icon: Container(
              padding: const EdgeInsets.only(left: 15),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            iconSize: 28,
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * .27,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            FutureBuilder(
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    "Hello ${snapshot.data!.username},",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'Oswald',
                                        fontWeight: FontWeight.normal),
                                  );
                                } else {
                                  return const Text('');
                                }
                              },
                              future: Userservice().getProfile(),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "Balance: Ksh 100.00",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "${time.day}th ${months[currentMon - 1]} ${time.year}.",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 247, 199, 127),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0)),
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 105,
                              padding: const EdgeInsets.only(right: 5),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const Payment()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.payment_outlined,
                                        color: Color.fromRGBO(255, 76, 0, 2),
                                        size: 20,
                                      ),
                                      Text(
                                        'Pay',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Oswald',
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              height: 60,
                              width: 105,
                              padding: const EdgeInsets.only(right: 5),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const WithDraw()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.money,
                                        color: Color.fromRGBO(255, 76, 0, 2),
                                        size: 20,
                                      ),
                                      Text(
                                        'Withdraw',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Oswald'),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              height: 60,
                              width: 105,
                              padding: const EdgeInsets.only(right: 5),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const Transfer()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.send_outlined,
                                        color: Color.fromRGBO(255, 76, 0, 2),
                                        size: 20,
                                      ),
                                      Text(
                                        'Send',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Oswald',
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 330,
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: const BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            child: const MyCode()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          Icons.qr_code,
                                          color: Color.fromRGBO(255, 76, 0, 2),
                                          size: 25,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Text(
                                            'My',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Oswald',
                                            ),
                                          ),
                                          Text(
                                            'Code',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Oswald',
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        )),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, bottom: 12),
                        child: Text(
                          "Statements",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: const Receipts()));
                          },
                          child: const Text(
                            "SEE ALL",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Oswald',
                                color: Color.fromRGBO(255, 76, 0, 2),
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Statements",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Oswald',
                                        color: Color.fromARGB(255, 99, 99, 99),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "12345",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Oswald',
                                        color: Color.fromARGB(255, 99, 99, 99),
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "-Ksh 200.00",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Oswald',
                                      color: Color.fromARGB(255, 99, 99, 99),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${time.day}th ${months[currentMon - 1]} ${time.year}.",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Oswald',
                                      color: Color.fromARGB(255, 99, 99, 99),
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 20),
                        child: Text(
                          "Other Options",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      )),
    );
  }
}
