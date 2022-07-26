import 'package:get/get.dart';

import '../../../../presentation/list_voucher/controllers/list_voucher.controller.dart';

class ListVoucherControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListVoucherController>(
      () => ListVoucherController(),
    );
  }
}
