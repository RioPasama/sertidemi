import 'package:get/get.dart';

import '../../../../presentation/status_transaction/controllers/status_transaction.controller.dart';

class StatusTransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusTransactionController>(
      () => StatusTransactionController(),
    );
  }
}
