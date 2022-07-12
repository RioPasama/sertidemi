import 'package:get/get.dart';

import '../../../../presentation/tiket_detail_event/controllers/tiket_detail_event.controller.dart';

class TiketDetailEventControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TiketDetailEventController>(
      () => TiketDetailEventController(),
    );
  }
}
