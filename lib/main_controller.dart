import 'package:flutter/material.dart';
import 'package:flutter_pushnotifications/services/push_notification_service.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    PushNotificationService.message.listen((message) {
      Get.snackbar(
        "PushNotifications",
        "Product $message",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
      Get.toNamed("message", arguments: message);
    });
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
