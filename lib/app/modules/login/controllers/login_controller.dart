import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/base/base_controller.dart';
import 'package:shoplover_rider/app/core/helper/dialogue_helper.dart';
import 'package:shoplover_rider/app/data/remote/model/auth/auth_request.dart';
import 'package:shoplover_rider/app/data/remote/repository/auth_repository.dart';

import '../../../core/connection_manager/connection_manager_controller.dart';
import '../../../routes/app_pages.dart';

class LoginController extends BaseController {
  // text field controllers
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // form key
  final formKey = GlobalKey<FormState>();

  // variables for error messages
  final emailErr = "".obs;
  final passwordErr = "".obs;

  @override
  void onInit() {
    super.onInit();
    
  }

  // validate email
  String? validateEmail(String email) {
    // validate email
    if (email.isEmpty) {
      emailErr.value = 'Email can\'t  be empty';
    } else if (!GetUtils.isEmail(email)) {
      emailErr.value = 'Email is not valid';
    } else {
      emailErr.value = '';
    }

    return emailErr.value.isNotEmpty ? emailErr.value : null;
  }

  // validate password
  String? validatePassword(String password) {
    if (password.isEmpty) {
      passwordErr.value = 'Password can\'t  be empty';
    } else if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      passwordErr.value = 'Password must be at least 6 characters';
    } else {
      passwordErr.value = '';
    }

    return passwordErr.value.isNotEmpty ? passwordErr.value : null;
  }

  // add login method here
  void login() async {
    // get email and password from text field controllers
    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();

    // show loading indicator
    showLoading();

    // calling the login api
    await AuthRepository().login(
      AuthRequest(email: email, password: password),
    );

    // for now, delay for 2 seconds
    //await Future.delayed(const Duration(seconds: 2), () {});

    // hide loading indicator
    hideLoading();

    // navigate to home page
    Get.offAllNamed(Routes.HOME);
  }

  hideLoading() {
    DialogueHelper.hideLoading();
  }

  showLoading() {
    DialogueHelper.showLoading();
  }
}
