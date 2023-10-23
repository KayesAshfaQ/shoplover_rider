import 'package:shoplover_rider/app/data/remote/model/auth/auth_request.dart';

import '../model/auth/register/register_response.dart';
import '../model/auth/login/login_response.dart';
import '../../../service/api_client.dart';
import '../../../service/api_end_point.dart';

class AuthRepository {
  Future<RegisterResponse> register(AuthRequest data) async {
    var response = await ApiClient().post(
      ApiEndPoints.REGISTER_URL,
      {},
      register,
      isHeaderRequired: false,
      isLoaderRequired: true,
    );

    return RegisterResponse.parse(response!.statusCode!, response.toString());
  }

  Future<LoginResponse> login(AuthRequest data) async {
    var response = await ApiClient().post(
      ApiEndPoints.LOGIN_URL,
      authRequestToJson(data),
      login,
      isHeaderRequired: false,
      isLoaderRequired: false,
      isJsonEncodeRequired: false,
    );

    return LoginResponse.parse(response!.statusCode!, response.toString());
  }
}
