import 'package:eazz/Services/Auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:eazz/HomePage/homepage.dart';
import 'package:flutter_session/flutter_session.dart';

class Verification extends StatefulWidget {
  const Verification({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<Verification> createState() => _VerificationState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
final codeTextController = TextEditingController();
final snackBar = SnackBar(
  content: const Text('Incorrect Verification Code'),
  action: SnackBarAction(
    label: 'Retry',
    onPressed: () {},
  ),
);

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.

class _VerificationState extends State<Verification> {
  String verificationCode = '';
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
          verificationCode = codeTextController.text;

          if (verificationCode.length == 5 && verificationCode != '') {
            APIService()
                .verification(verificationCode, widget.phoneNumber)
                .then((response) async => {
                      if (response.token != "")
                        {
                          await FlutterSession().set('token', response.token),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          )
                        }
                    })
                .onError((error, stackTrace) => {
                      if (error != "")
                        {
                          snackBar,
                          ScaffoldMessenger.of(context).showSnackBar(snackBar)
                        }
                    });
          }
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
                    controller: codeTextController,
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
