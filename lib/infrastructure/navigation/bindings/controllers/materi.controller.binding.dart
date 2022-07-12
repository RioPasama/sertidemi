import 'package:get/get.dart';

import '../../../../presentation/materi/controllers/materi.controller.dart';

class MateriControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriController>(
      () => MateriController(),
    );
  }
}
