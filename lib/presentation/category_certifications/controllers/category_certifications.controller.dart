import 'package:get/get.dart';

class CategoryCertificationsController extends GetxController {
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
      title.value = 'Kategori Event';
    } else {
      title.value = 'Kategori Sertifikasi';
    }
  }
}
