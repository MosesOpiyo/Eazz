import 'dart:convert';

RegistrationResponseModel registrationResponseModel(String str) =>
    RegistrationResponseModel.fromJson(json.decode(str));

class RegistrationResponseModel {
  RegistrationResponseModel({
    required this.phoneNumber,
  });
  late final String phoneNumber;

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}
