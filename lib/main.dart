import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/binding/initial_binding.dart';
import 'app/core/style/app_colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Shoplover Rider",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.whitePure,
      ),
    ),
  );
}
