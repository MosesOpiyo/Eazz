import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  String? token;
  String? username;
  String? email;
  String? phoneNumber;
  String? licensePlate;

  LoginResponseModel(
      {this.token,
      this.email,
      this.username,
      this.licensePlate,
      this.phoneNumber});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    licensePlate = json['license_plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["token"] = this.token;
    data["user"]["username"] = this.username;
    data["user"]["email"] = this.email;
    data["phone_number"] = this.phoneNumber;
    data["license_plate"] = this.licensePlate;

    return data;
  }
}
