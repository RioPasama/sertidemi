import 'package:get/get.dart';

import '../../../../presentation/verification_email/controllers/verification_email.controller.dart';

class VerificationEmailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationEmailController>(
      () => VerificationEmailController(),
    );
  }
}
