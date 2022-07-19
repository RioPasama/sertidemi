import 'package:get/get.dart';

import '../../../../presentation/forgot_passwrod/controllers/forgot_passwrod.controller.dart';

class ForgotPasswrodControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswrodController>(
      () => ForgotPasswrodController(),
    );
  }
}
