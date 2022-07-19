import 'package:get/get.dart';

import '../../../../presentation/register_event/controllers/register_event.controller.dart';

class RegisterEventControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterEventController>(
      () => RegisterEventController(),
    );
  }
}
