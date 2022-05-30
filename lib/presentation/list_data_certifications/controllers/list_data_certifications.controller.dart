import 'package:get/get.dart';

class ListDataCertificationsController extends GetxController {
  RxString title = ''.obs;

  @override
  void onInit() {
    setTitle();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setTitle() {
    if (Get.arguments == 1) {
      title.value = 'Event';
    } else {
      title.value = 'Sertifikasi';
    }
  }
}
