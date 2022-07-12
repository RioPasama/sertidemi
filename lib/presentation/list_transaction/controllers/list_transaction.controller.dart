import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';

class ListTransactionController extends GetxController {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());

  @override
  void onInit() {
    authenticationControllercontroller.auth();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
