import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoplover_rider/app/core/common/widgets/app_widgets.dart';
import 'package:shoplover_rider/app/core/widgets/my_edit_text.dart';
import 'package:shoplover_rider/app/core/widgets/rounded_button.dart';

import '../../../core/base/base_view.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/style/app_colors.dart';
import '../controllers/register_controller.dart';

class RegisterView extends BaseView<RegisterController> {
  RegisterView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    Get.put(RegisterController());

    return SafeArea(
      child: FormBuilder(
        key: controller.registerFieldKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                SvgPicture.asset(cartFullIcon),

                AppWidgets().gapH8(),

                // show text shop lover here
                const Text(
                  'Register a new account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),

                AppWidgets().gapH16(),

                // email text field
                MyEditText(
                  "Email",
                  controller.emailController.value,
                  needToShowTitle: false,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  needPrefixIcon: true,
                  prefixIconPath: envelopeIcon,
                  needHintText: true,
                  hintText: 'Enter your email',
                  needValidate: true,
                  isEmail: true,
                  borderColorOpacity: 0.4,
                  textInputType: TextInputType.emailAddress,
                ),

                AppWidgets().gapH16(),

                // password text field
                MyEditText(
                  "Password",
                  controller.passwordController.value,
                  needToShowTitle: false,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  needPrefixIcon: true,
                  prefixIconPath: lockIcon,
                  needHintText: true,
                  hintText: 'Enter your password',
                  isPassword: true,
                  needValidate: true,
                  minLength: 8,
                  maxLength: 20,
                  isObscure: controller.isPasswordObscure.value,
                  showEye: true,
                  eyeClick: controller.onPasswordEyeClick,
                ),

                AppWidgets().gapH16(),

                // confirm password text field
                MyEditText(
                  "Confirm Password",
                  controller.confirmPasswordController.value,
                  needToShowTitle: false,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  needPrefixIcon: true,
                  prefixIconPath: lockIcon,
                  needHintText: true,
                  hintText: 'Re-type your password',
                  needValidate: true,
                  isPassword: true,
                  borderColorOpacity: 0.4,
                  isObscure: controller.isConfirmPasswordObscure.value,
                  showEye: true,
                  eyeClick: controller.onConfirmPasswordEyeClick,
                ),

                AppWidgets().gapH16(),

                RoundedButton(
                  context,
                  'Register',
                  borderRadius: 8,
                  borderColor: Colors.transparent,
                ),

                AppWidgets().gapH8(),

                // register button
                TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: () => controller.onPressRegister(),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' ${AppStrings.login} ',
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
    );
  }
}
