import 'package:flutter/material.dart';
import 'package:eazz/HomePage/homepage.dart';

class Verification extends StatefulWidget {
  const Verification({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: SizedBox(
            width: 90,
            height: 50,
            child: Image.asset('assets/Appbar_logo.png', fit: BoxFit.cover),
          )),
      body: registrationUI(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: const Color.fromRGBO(255, 76, 0, 2),
        child: const Icon(
          Icons.login,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget registrationUI(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsetsDirectional.only(start: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Verification Code",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Code'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "A verfication code has been sent to ${widget.phoneNumber}.",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Enter the code sent to verify.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    ));
  }
}
