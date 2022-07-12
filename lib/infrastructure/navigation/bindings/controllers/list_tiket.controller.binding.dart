import 'package:get/get.dart';

import '../../../../presentation/list_tiket/controllers/list_tiket.controller.dart';

class ListTiketControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTiketController>(
      () => ListTiketController(),
    );
  }
}
