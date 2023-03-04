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
              ))
        ],
      )),
    );
  }
}