import 'register_response_success.dart';
import '../auth_response_unsuccess.dart';

abstract class RegisterResponse {
  static RegisterResponse parse(int statusCode, response) {
    if (statusCode == 200) {
      return registerResponseFromJson(response);
    } else {
      return authUnsuccessResponseFromJson(response);
    }
  }
}
