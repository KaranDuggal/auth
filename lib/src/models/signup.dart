// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

String signupToJson(Signup data) => json.encode(data.toJson());

class Signup {
    Signup({
        required this.success,
        required this.message,
        this.data,
    });

    bool success;
    String message;
    Data ? data;

    factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        success: json["success"],
        message: json["message"],
        data : json['data'] != null ? new Data.fromJson(json['data']) : null,
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Data({
      this.firstName,
      this.lastName,
      this.email,
      this.password,
    });

    String ? firstName;
    String ? lastName;
    String ? email;
    String ? password;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
    };
}
