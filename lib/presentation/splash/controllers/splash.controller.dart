import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(Routes.MAIN);
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
