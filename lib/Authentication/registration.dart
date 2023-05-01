// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, import_of_legacy_library_into_null_safe, file_names
import 'package:eazz/Authentication/verification.dart';
import 'package:eazz/HomePage/homepage.dart';
import 'package:eazz/Services/Auth/auth_service.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:page_transition/page_transition.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

GlobalKey<FormState> formKey = GlobalKey<FormState>();
final phoneNumberTextController = TextEditingController();
final countryTextController = TextEditingController();

class _RegistrationState extends State<Registration> {
  String phoneNumber = '';
  String numberCode = '';
  String fullPhoneNumber = '';
  final countryPicker = const FlCountryCodePicker();
  final prefs = SharedPreferences.getInstance();
  CountryCode? countryCode;
  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getString('token');
    if (stringValue != null) {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {}
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
        backgroundColor: const Color.fromRGBO(255, 76, 0, 2),
        onPressed: () async {
          if (numberCode != "" && phoneNumber.length == 9) {
            phoneNumber = phoneNumberTextController.text;
            numberCode = countryTextController.text;
            fullPhoneNumber = numberCode + phoneNumber;
            bool result = await InternetConnectionChecker().hasConnection;
            if (result == true) {
              if (fullPhoneNumber != "") {
                AlertDialog alert = AlertDialog(
                  title: const Text("Confirmation"),
                  content: Text(
                    "Confirm your phone Number is $fullPhoneNumber.",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          APIService().registration(fullPhoneNumber);
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: Verification(
                                      phoneNumber: fullPhoneNumber)));
                        },
                        child: const Text("Confirm",
                            style: TextStyle(color: Colors.deepOrange))),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.deepOrange))),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              } else if (numberCode == "") {
                numberCode = "+1";
                phoneNumber = phoneNumberTextController.text;
              }
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
          } else if (phoneNumber.length > 9 || phoneNumber.length < 9) {}
        },
        child: const Icon(
          Icons.arrow_forward,
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
            padding: const EdgeInsets.all(10),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(
                  width: 330,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: phoneNumberTextController,
                    autofocus: true,
                    maxLines: 1,
                    onFieldSubmitted: ((value) {
                      if (numberCode != "" && phoneNumber.length == 9) {
                        phoneNumber = phoneNumberTextController.text;
                        numberCode = countryTextController.text;
                        fullPhoneNumber = numberCode + phoneNumber;
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: Verification(
                                    phoneNumber: fullPhoneNumber)));
                      } else if (numberCode == "") {
                        numberCode = "+1";
                        phoneNumber = phoneNumberTextController.text;
                      } else if (phoneNumber.length > 9 ||
                          phoneNumber.length < 9) {}
                    }),
                    decoration: InputDecoration(
                      prefix: GestureDetector(
                        onTap: () async {
                          final code = await countryPicker.showPicker(
                            context: context,
                            scrollToDeviceLocale: true,
                          );
                          if (code != null) {
                            setState(() => countryCode = code);
                            countryTextController.text = code.dialCode;
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Text(countryCode?.dialCode ?? '+1',
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                      labelText: 'Country Code and Number',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
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
