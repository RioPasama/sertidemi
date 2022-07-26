import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/card_voucher_all_product_view.dart';
import 'package:sertidemi/presentation/voucher/controllers/voucher.controller.dart';

class VoucherContentView extends GetView {
  VoucherContentView({Key? key}) : super(key: key);

  @override
  final VoucherController controller = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
      itemBuilder: (context, index) {
        return CardVoucherAllProductView(
            data: controller.listVoucherAllProductModel[index]);
      },
    );
  }
}
