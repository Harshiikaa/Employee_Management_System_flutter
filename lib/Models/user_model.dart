// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.id,
    this.userId,
    this.fcmToken,
    this.fullname,
    this.phone,
    this.email,
    this.password,
  });

  String? id;
  String? userId;
  String? fcmToken;
  String? fullname;
  String? phone;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  factory UserModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        fullname: json["fullname"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fcm_token": fcmToken,
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
