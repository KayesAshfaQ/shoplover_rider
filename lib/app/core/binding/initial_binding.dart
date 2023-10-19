import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/connection_manager/connnection_manager_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    ConnectionManagerBinding().dependencies();
  }
}
