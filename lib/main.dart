import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/connection_manager/connection_manager_controller.dart';
import 'app/core/style/app_colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(ConnectionManagerController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    ),
  );
}
