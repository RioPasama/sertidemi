import 'package:get/get.dart';

import '../../../../presentation/register_assessment/controllers/register_assessment.controller.dart';

class RegisterAssessmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterAssessmentController>(
      () => RegisterAssessmentController(),
    );
  }
}
