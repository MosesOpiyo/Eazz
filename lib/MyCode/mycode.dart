import 'package:flutter/material.dart';

class MyCode extends StatefulWidget {
  const MyCode({super.key});

  @override
  State<MyCode> createState() => _MyCodeState();
}

class _MyCodeState extends State<MyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Container(
          padding: const EdgeInsets.all(10),
          width: 95,
          height: 40,
          child: const Text(
            "My Code",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 50,
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
          onPressed: () {},
          child: const Text('Send'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                          child: const Text("This is your personal code.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const Text("Use it when:",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Text("1. Receiving Money",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Text("2. Depositing Money to your Account.",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                width: 330,
                height: 330,
                color: Colors.black,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
