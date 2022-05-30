import 'package:get/get.dart';

import '../../../../presentation/category_certifications/controllers/category_certifications.controller.dart';

class CategoryCertificationsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryCertificationsController>(
      () => CategoryCertificationsController(),
    );
  }
}
