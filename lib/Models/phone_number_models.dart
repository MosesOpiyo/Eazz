import 'dart:convert';

RegistrationResponseModel registrationResponseModel(String str) =>
    RegistrationResponseModel.fromJson(json.decode(str));

class RegistrationResponseModel {
  RegistrationResponseModel({
    required this.email,
    required this.phoneNumber,
  });
  late final String email;
  late final String phoneNumber;

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phone_number'];
  }

  Map<dynamic, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
