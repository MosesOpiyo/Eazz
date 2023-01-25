import 'package:eazz/Models/phone_number_models.dart';
import 'package:http/http.dart' as http;
import 'package:eazz/Constants/constants.dart';
import 'dart:convert';

class APIService {
  var client = http.Client();

  Future<RegistrationResponseModel> registration(String phoneNumber) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    };
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userRegistration);

    var response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({"phone_number": phoneNumber}),
    );
    print(response.body);
    return registrationResponseModel(response.body);
  }
}
