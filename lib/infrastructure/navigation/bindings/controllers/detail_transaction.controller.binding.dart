import 'package:get/get.dart';

import '../../../../presentation/detail_transaction/controllers/detail_transaction.controller.dart';

class DetailTransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionController>(
      () => DetailTransactionController(),
    );
  }
}
