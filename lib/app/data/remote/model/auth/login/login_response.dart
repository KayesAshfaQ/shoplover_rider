import '../auth_response_unsuccess.dart';
import 'login_response_success.dart';

abstract class LoginResponse {
  static LoginResponse parse(int statusCode, response) {
    if (statusCode == 200) {
      return loginSuccessResponseFromJson(response);
    } else {
      return authUnsuccessResponseFromJson(response);
    }
  }
}
