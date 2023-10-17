import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // design the login page here
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // app logo
                SvgPicture.asset(AppAssets.cartFullIcon),

                const SizedBox(height: 16),

                // show text shop lover here
                const Text(
                  AppStrings.loginToYourAccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: controller.emailController.value,
                  decoration: InputDecoration(
                    labelText: AppStrings.email,
                    errorText: controller.emailErr.value.isNotEmpty
                        ? controller.emailErr.value
                        : null,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) => controller.validateEmail(value!),
                ),

                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.passwordController.value,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppStrings.password,
                    border: const OutlineInputBorder(),
                    errorText: controller.passwordErr.value.isNotEmpty
                        ? controller.passwordErr.value
                        : null,
                  ),
                  validator: (value) => controller.validatePassword(value!),
                ),

                const SizedBox(height: 16),
                // add buttons here
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      // call login method here
                      controller.login();
                    }
                  },
                  child: Text(
                    AppStrings.login,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // show this message is not available yet
                    Get.snackbar(
                      'Coming soon',
                      'This feature is not available yet',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
