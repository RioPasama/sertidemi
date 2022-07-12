import 'package:get/get.dart';

import '../../../../presentation/questions_multiple_choice/controllers/questions_multiple_choice.controller.dart';

class QuestionsMultipleChoiceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionsMultipleChoiceController>(
      () => QuestionsMultipleChoiceController(),
    );
  }
}
