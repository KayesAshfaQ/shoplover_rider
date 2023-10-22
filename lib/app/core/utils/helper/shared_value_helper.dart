import 'package:shared_value/shared_value.dart';

class SharedValueHelper {
  final SharedValue<bool> isLoggedIn = SharedValue(
    key: 'is_logged_in',
    value: false,
  );

  final SharedValue<bool> keepSignedIn = SharedValue(
    key: 'keep_signed_in',
    value: false,
  );

  final SharedValue<int> userId = SharedValue(
    value: 0,
    key: "id",
  );

  final SharedValue<String> userName = SharedValue(
    value: "",
    key: "username",
  );
  final SharedValue<String> accessToken = SharedValue(
    value: "",
    key: "accessToken",
  );

  final SharedValue<String> expiredTime = SharedValue(
    value: "",
    key: "expired_time",
  );

  final SharedValue<String> refreshToken = SharedValue(
    value: "",
    key: "refresh_token",
  );
}
