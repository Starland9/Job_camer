import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtils {
  static showGoodToast(String message) {
    Get.snackbar(
      "Succès",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static showErrorToast(String message) {
    Get.snackbar(
      "Erreur",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static showWarningToast(String message) {
    Get.snackbar(
      "Avertissement",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.yellow,
      colorText: Colors.black,
    );
  }
}
