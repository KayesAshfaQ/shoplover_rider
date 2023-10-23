import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/base/base_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shoplover_rider/app/core/style/app_colors.dart';

import '../../../data/remote/model/auth/auth_request.dart';
import '../../../data/remote/model/auth/register/register_response.dart';
import '../../../data/remote/model/auth/register/register_response_success.dart';
import '../../../data/remote/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends BaseController {
  final registerFieldKey = GlobalKey<FormBuilderState>();

  // text field controller
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  // for obscure text
  final isPasswordObscure = true.obs;
  final isConfirmPasswordObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void passwordValidator(String value) {}

  onPasswordEyeClick(BuildContext context) {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  onConfirmPasswordEyeClick(BuildContext context) {
    isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value;
  }

  void onPressRegister() async {
    print('onPress Register');

    // validate all fields
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.length >= 8 &&
        confirmPasswordController.value.text.length >= 8 &&
        (passwordController.value.text ==
            confirmPasswordController.value.text)) {
      // if all fields are valid, then navigate to home screen

      // calling the login api
      var response = await AuthRepository().register(
        AuthRequest(
          email: emailController.value.text.toString(),
          password: passwordController.value.text.toString(),
        ),
      );

      // check response object type by class name
      if (response is RegisterResponseSuccess) {
        // show success message
        Get.snackbar(
          'Success',
          'Register successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.green,
          colorText: AppColors.white,
        );

        // navigate to home screen
        Get.offAllNamed(Routes.HOME);
      } else {
        // show error message
        Get.snackbar(
          'Error',
          'Please enter valid data',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.red,
          colorText: AppColors.white,
        );
      }

      // Get.offAllNamed(Routes.HOME);

      // or navigate to login screen
    } else {
      // show error message
      Get.snackbar(
        'Error',
        'Please enter valid data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
      );
    }
  }
}
