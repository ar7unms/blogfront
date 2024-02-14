// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  String name;
  String age;
  String mobile;
  String pincode;
  String email;
  String password;

  Welcome({
    required this.name,
    required this.age,
    required this.mobile,
    required this.pincode,
    required this.email,
    required this.password,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: json["name"],
    age: json["age"],
    mobile: json["mobile"],
    pincode: json["pincode"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "mobile": mobile,
    "pincode": pincode,
    "email": email,
    "password": password,
  };
}
