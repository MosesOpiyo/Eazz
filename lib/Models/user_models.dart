// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

import 'dart:convert';

class UserResponseModel {
  final String username;
  final String phoneNumber;

  const UserResponseModel({
    required this.username,
    required this.phoneNumber,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      username: json['user']['username'],
      phoneNumber: json['user']['phone_number'],
    );
  }
}

UsernameResponseModel usernameResponseJson(String str) =>
    UsernameResponseModel.fromJson(json.decode(str));

class UsernameResponseModel {
  String? username;

  UsernameResponseModel({this.username});

  UsernameResponseModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user"]["username"] = this.username;
    return data;
  }
}
