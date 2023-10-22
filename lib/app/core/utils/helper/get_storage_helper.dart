import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  final gs = GetStorage();

  gsRead({key}) {
    return gs.read(key);
  }

  gsWrite({key, value}) {
    return gs.write(key, value);
  }

  gsDelete({key}) {
    return gs.remove(key);
  }

  gsHasData({key}) {
    return gs.hasData(key);
  }
}
