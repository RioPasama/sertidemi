import 'package:get/get.dart';

import '../../../../presentation/event_list/controllers/event_list.controller.dart';

class EventListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventListController>(
      () => EventListController(),
    );
  }
}
