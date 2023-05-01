import 'package:flutter/material.dart';
import 'package:eazz/Services/User/user_service.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
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
                            child: const Text("ACCOUNT",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Oswald',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          FutureBuilder(
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return SizedBox(
                                  width: size.width,
                                  child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                                child: Text(
                                              snapshot.data!.username
                                                  .substring(0, 2)
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontSize: 10,
                                                  fontFamily: 'Oswald',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.username
                                                      .toUpperCase(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Oswald',
                                                      color: Color.fromARGB(
                                                          255, 99, 99, 99),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  snapshot.data!.phoneNumber,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Oswald',
                                                      color: Color.fromARGB(
                                                          255, 99, 99, 99),
                                                      fontWeight:
                                                          FontWeight.w200),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "EDIT",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Oswald',
                                                      color: Color.fromRGBO(
                                                          255, 76, 0, 2),
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              } else {
                                return const Text('');
                              }
                            },
                            future: Userservice().getProfile(),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 99, 99, 99),
                      fontWeight: FontWeight.w600),
                )),
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        width: 40,
                        height: 40,
                        child: const Center(
                            child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 15,
                        ))),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "SHARE APP LINK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        width: 40,
                        height: 40,
                        child: const Center(
                            child: Icon(
                          Icons.help,
                          color: Colors.white,
                          size: 15,
                        ))),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "HELP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)),
                        width: 40,
                        height: 40,
                        child: const Center(
                            child: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 15,
                        ))),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
