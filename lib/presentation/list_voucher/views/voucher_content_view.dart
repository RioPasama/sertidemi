import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/views/views/card_voucher_all_product_view.dart';
import 'package:sertidemi/presentation/voucher/controllers/voucher.controller.dart';

class VoucherContentView extends GetView {
  final List<ListVoucherAllProductModel> data;
  VoucherContentView({required this.data, Key? key}) : super(key: key);

  @override
  final VoucherController controller = Get.put(VoucherController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CardVoucherAllProductView(data: data[index]);
        },
      ),
    );
  }
}
