import 'package:get/get.dart';

import '../../../../presentation/assessment_list/controllers/assessment_list.controller.dart';

class AssessmentListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentListController>(
      () => AssessmentListController(),
    );
  }
}
