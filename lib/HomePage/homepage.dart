import 'package:flutter/material.dart';

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
          onPressed: () {},
          icon: const Icon(Icons.sort),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline_outlined),
            iconSize: 28,
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromRGBO(255, 76, 0, 2),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  label: 'Account',
                ),
              ],
              currentIndex: 0,
              selectedItemColor: Colors.white,
              onTap: ((value) {}),
            ),
          )),
      body: SafeArea(
          child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * .3,
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Hello User,",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
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
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          "Operations",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
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
                              height: 100,
                              width: 105,
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
                                  onPressed: () {},
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
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              height: 100,
                              width: 105,
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
                                  onPressed: () {},
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
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              height: 100,
                              width: 105,
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
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.compare_arrows_rounded,
                                        color: Color.fromRGBO(255, 76, 0, 2),
                                        size: 20,
                                      ),
                                      Text(
                                        'Transfer',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          "Records",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 99, 99, 99),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
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
                              height: 100,
                              width: 160,
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
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          Icons.receipt_long_rounded,
                                          color: Color.fromRGBO(255, 76, 0, 2),
                                          size: 25,
                                        ),
                                      ),
                                      Text(
                                        'Receipts',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              height: 100,
                              width: 160,
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
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(
                                          Icons.wallet,
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
                                            'Transaction',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            'Records',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        )),
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
