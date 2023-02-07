// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:eazz/Models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:eazz/Constants/constants.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Userservice {
  var client = http.Client();

  Future<UserResponseModel> getProfile() async {
    String? token;
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
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
