import 'package:get/get.dart';

import '../../../../presentation/my_voucher/controllers/my_voucher.controller.dart';

class MyVoucherControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyVoucherController>(
      () => MyVoucherController(),
    );
  }
}
