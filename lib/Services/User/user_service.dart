import 'package:eazz/Models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:eazz/Constants/constants.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'dart:io';

class Userservice {
  var client = http.Client();

  Future<UserResponseModel> getProfile() async {
    var token = await FlutterSession().get("token");
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userProfile);

    var response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: "Token $token"},
    );
    if (response.statusCode == 200) {
      return UserResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
