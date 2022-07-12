import 'package:get/get.dart';

import '../../../../presentation/ebook/controllers/ebook.controller.dart';

class EbookControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookController>(
      () => EbookController(),
    );
  }
}
