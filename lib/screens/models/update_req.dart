// To parse this JSON data, do
//
//     final updateReq = updateReqFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateReq updateReqFromJson(String str) => UpdateReq.fromJson(json.decode(str));

String updateReqToJson(UpdateReq data) => json.encode(data.toJson());

class UpdateReq {
  String name;
  String email;
  int age;
  String password;

  UpdateReq({
    required this.name,
    required this.email,
    required this.age,
    required this.password,
  });

  factory UpdateReq.fromJson(Map<String, dynamic> json) => UpdateReq(
    name: json["name"],
    email: json["email"],
    age: json["age"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "age": age,
    "password": password,
  };
}
