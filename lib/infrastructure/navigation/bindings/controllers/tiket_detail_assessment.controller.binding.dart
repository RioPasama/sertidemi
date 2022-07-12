import 'package:get/get.dart';

import '../../../../presentation/tiket_detail_assessment/controllers/tiket_detail_assessment.controller.dart';

class TiketDetailAssessmentControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TiketDetailAssessmentController>(
      () => TiketDetailAssessmentController(),
    );
  }
}
