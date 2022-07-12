import 'package:get/get.dart';

import '../../../../presentation/assessment_detail/controllers/assessment_detail.controller.dart';

class AssessmentDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentDetailController>(
      () => AssessmentDetailController(),
    );
  }
}
