import 'package:get/get.dart';

import '../../../../presentation/certification/controllers/certification.controller.dart';

class CertificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CertificationController>(
      () => CertificationController(),
    );
  }
}
