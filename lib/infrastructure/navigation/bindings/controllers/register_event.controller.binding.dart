import 'package:get/get.dart';

import 'package:sertidemi/presentation/register_event/controllers/register_event_api_controller.dart';

import '../../../../presentation/register_event/controllers/register_event.controller.dart';

class RegisterEventControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterEventApiController>(
      () => RegisterEventApiController(),
    );
    Get.lazyPut<RegisterEventController>(
      () => RegisterEventController(),
    );
  }
}
