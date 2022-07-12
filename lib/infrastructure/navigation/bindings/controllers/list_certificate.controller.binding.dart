import 'package:get/get.dart';

import '../../../../presentation/list_certificate/controllers/list_certificate.controller.dart';

class ListCertificateControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCertificateController>(
      () => ListCertificateController(),
    );
  }
}
