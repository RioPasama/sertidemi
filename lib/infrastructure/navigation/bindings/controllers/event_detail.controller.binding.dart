import 'package:get/get.dart';

import '../../../../presentation/event_detail/controllers/event_detail.controller.dart';

class EventDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
  }
}
