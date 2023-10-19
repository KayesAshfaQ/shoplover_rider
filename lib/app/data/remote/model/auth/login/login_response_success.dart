import 'dart:convert';

import 'package:shoplover_rider/app/data/remote/model/auth/login/login_response.dart';

LoginSuccessResponse loginSuccessResponseFromJson(String str) =>
    LoginSuccessResponse.fromJson(json.decode(str));

String loginSuccessResponseToJson(LoginSuccessResponse data) =>
    json.encode(data.toJson());

class LoginSuccessResponse implements LoginResponse {
  String token;

  LoginSuccessResponse({
    required this.token,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) =>
      LoginSuccessResponse(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
