import 'dart:convert';

import 'login/login_response.dart';
import 'register/register_response.dart';

AuthResponseUnsuccess authUnsuccessResponseFromJson(String str) =>
    AuthResponseUnsuccess.fromJson(json.decode(str));

String authUnsuccessResponseToJson(AuthResponseUnsuccess data) =>
    json.encode(data.toJson());

class AuthResponseUnsuccess implements RegisterResponse, LoginResponse {
  String error;

  AuthResponseUnsuccess({
    required this.error,
  });

  factory AuthResponseUnsuccess.fromJson(Map<String, dynamic> json) =>
      AuthResponseUnsuccess(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
