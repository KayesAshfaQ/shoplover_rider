import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.LOGIN);
    });
    super.onInit();
    print('onInit');
  }

  @override
  void onReady() {
    super.onReady();
  }
}
