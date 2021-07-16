// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    Login({
        required this.success,
        required this.message,
        this.data,
        this.token,
    });

    bool success;
    String message;
    Data ? data;
    String ? token;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        message: json["message"],
        data : json['data'] != null ? new Data.fromJson(json['data']) : null,
        // data: Data.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
        "token": token,
    };
}

class Data {
    Data({
        this.role,
        this.deviceType,
        this.isVerified,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.createdAt,
        this.updatedAt,
    });

    String ? role;
    String ? deviceType;
    bool ? isVerified;
    String ? id;
    String ? firstName;
    String ? lastName;
    String ? email;
    DateTime ? createdAt;
    DateTime ? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        role: json["role"],
        deviceType: json["deviceType"],
        isVerified: json["isVerified"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "deviceType": deviceType,
        "isVerified": isVerified,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}
