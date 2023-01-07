import 'package:flutter/material.dart';

import 'Verification.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
            MaterialPageRoute(builder: (context) => const Verification()),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.arrow_forward),
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
              "Your Phone",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Register with your phone number",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Country'),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(end: 10),
                child: SizedBox(
                  width: 80,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Code'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: SizedBox(
                  width: 190,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "An SMS with a verification code will be sent to your phone.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    ));
  }
}
