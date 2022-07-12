import 'package:get/get.dart';

import '../../../../presentation/assessment/controllers/assessment.controller.dart';

class AssessmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentController>(
      () => AssessmentController(),
    );
  }
}
