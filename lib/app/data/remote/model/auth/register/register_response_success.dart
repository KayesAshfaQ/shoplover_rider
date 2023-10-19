import 'dart:convert';

import 'register_response.dart';

RegisterResponseSuccess registerResponseFromJson(String str) =>
    RegisterResponseSuccess.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponseSuccess data) =>
    json.encode(data.toJson());

class RegisterResponseSuccess implements RegisterResponse {
  int id;
  String token;

  RegisterResponseSuccess({
    required this.id,
    required this.token,
  });

  factory RegisterResponseSuccess.fromJson(Map<String, dynamic> json) =>
      RegisterResponseSuccess(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
