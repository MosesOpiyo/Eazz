import 'package:eazz/Models/phone_number_models.dart';
import 'package:eazz/Models/code_models.dart';
import 'package:eazz/Models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:eazz/Constants/constants.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io';

class APIService {
  var client = http.Client();

  Future<RegistrationResponseModel> registration(String phoneNumber) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userRegistration);

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone_number": phoneNumber}),
    );
    return registrationResponseModel((response.body));
  }

  Future<VerificationResponseModel> verification(
      String verificationCode, String phoneNumber) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userVerification);

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone_number": phoneNumber, "code": verificationCode}),
    );
    return verificationResponseJson(response.body);
  }

  Future<UsernameResponseModel> username(String username) async {
    var token = await FlutterSession().get("token");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: "Token $token"
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userName);

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"username": username}),
    );
    return usernameResponseJson(response.body);
  }
}
