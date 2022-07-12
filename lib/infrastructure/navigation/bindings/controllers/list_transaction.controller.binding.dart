import 'package:get/get.dart';

import '../../../../presentation/list_transaction/controllers/list_transaction.controller.dart';

class ListTransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTransactionController>(
      () => ListTransactionController(),
    );
  }
}
