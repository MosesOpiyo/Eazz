// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously, import_of_legacy_library_into_null_safe
import 'package:eazz/Services/Auth/auth_service.dart';
import 'package:eazz/Services/User/user_service.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verification extends StatefulWidget {
  const Verification({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<Verification> createState() => _VerificationState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
Future<SharedPreferences> prefs = SharedPreferences.getInstance();
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
  setToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

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
        onPressed: () async {
          verificationCode = codeTextController.text;

          if (verificationCode.length == 5 && verificationCode != '') {
            bool result = await InternetConnectionChecker().hasConnection;
            if (result == true) {
              APIService()
                  .verification(verificationCode, widget.phoneNumber)
                  .then((response) async => {
                        setToken(response.token),
                        Userservice().getProfile().then((user) => {
                              if (user.username == null)
                                {Navigator.pushNamed(context, '/Username')}
                              else if (user.username != null)
                                {Navigator.pushNamed(context, '/Home')}
                            })
                      })
                  .onError((error, stackTrace) => {
                        if (error != "")
                          {
                            snackBar,
                            ScaffoldMessenger.of(context).showSnackBar(snackBar)
                          }
                      });
            } else if (result != true) {
              final snackBar = SnackBar(
                content: const Text('No Internet Connection.'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
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
