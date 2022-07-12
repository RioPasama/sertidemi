import 'package:get/get.dart';

import '../../../../presentation/finish_assessment/controllers/finish_assessment.controller.dart';

class FinishAssessmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinishAssessmentController>(
      () => FinishAssessmentController(),
    );
  }
}
