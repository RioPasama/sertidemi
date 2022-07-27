import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/card_my_voucher_view.dart';
import 'package:sertidemi/presentation/my_voucher/controllers/my_voucher.controller.dart';

class MyVoucherContentView extends GetView {
  MyVoucherContentView({Key? key}) : super(key: key);

  @override
  final MyVoucherController controller = Get.put(MyVoucherController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.listVoucherAllProductModel.length,
        itemBuilder: (context, index) {
          return cardMyVoucherAllProductView(
              controller.listVoucherAllProductModel[index]);
        });
  }
}
