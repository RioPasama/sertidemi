import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/views/views/card_voucher_all_product_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
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
          return CardVoucherAllProductView(
              data: controller.listVoucherAllProductModel[index]);
        });
  }
}
