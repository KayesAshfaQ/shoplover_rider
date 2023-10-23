import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/base/base_view.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/style/app_colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      // design the login page here
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // app logo
                    SvgPicture.asset(cartFullIcon),

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

                    // email text field
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

                    // password text field
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

                    // login button
                    ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          // call login method here
                          controller.login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        AppStrings.login,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // forgot password button
                    TextButton(
                      // make text button padding to zero vertically and horizontally

                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () => controller.featureComingSoonBar(),
                      child: const Text(
                        AppStrings.forgotPassword,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    // register button
                    TextButton(
                      style: TextButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () => controller.onPressRegister(),
                      child: RichText(
                        text: const TextSpan(
                          text: AppStrings.dontHaveAccount,
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: ' ${AppStrings.register} ',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: AppStrings.now),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
