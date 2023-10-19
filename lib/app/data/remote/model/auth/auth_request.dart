import 'dart:convert';

AuthRequest authRequestFromJson(String str) => AuthRequest.fromJson(json.decode(str));

String authRequestToJson(AuthRequest data) => json.encode(data.toJson());

class AuthRequest {
    String email;
    String password;

    AuthRequest({
        required this.email,
        required this.password,
    });

    factory AuthRequest.fromJson(Map<String, dynamic> json) => AuthRequest(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
