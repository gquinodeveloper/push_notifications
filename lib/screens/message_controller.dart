import 'package:get/get.dart';

class MessageController extends GetxController {
  RxString param = RxString("");
  @override
  void onInit() {
    param.value = Get.arguments as String;
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
