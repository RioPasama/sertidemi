import 'package:get/get.dart';

import '../../../../presentation/list_data_certifications/controllers/list_data_certifications.controller.dart';

class ListDataCertificationsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDataCertificationsController>(
      () => ListDataCertificationsController(),
    );
  }
}
