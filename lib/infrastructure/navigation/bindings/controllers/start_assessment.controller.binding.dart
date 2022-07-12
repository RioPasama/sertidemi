import 'package:get/get.dart';

import '../../../../presentation/start_assessment/controllers/start_assessment.controller.dart';

class StartAssessmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartAssessmentController>(
      () => StartAssessmentController(),
    );
  }
}
