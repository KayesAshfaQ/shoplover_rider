import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogueHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: 8),
              Text(message ?? 'Please wait...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
}
