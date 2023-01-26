// ignore_for_file: unnecessary_this, unnecessary_new

import 'dart:convert';

VerificationResponseModel verificationResponseJson(String str) =>
    VerificationResponseModel.fromJson(json.decode(str));

class VerificationResponseModel {
  String? token;
  String? phoneNumber;

  VerificationResponseModel({this.token, this.phoneNumber});

  VerificationResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["token"] = this.token;
    data["user"]["phone_number"] = this.phoneNumber;
    return data;
  }
}
