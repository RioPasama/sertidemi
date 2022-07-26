import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_model.dart';
import 'package:sertidemi/app/views/views/card_voucher_view.dart';

class ListVoucherContentView extends GetView {
  final List<ListVoucherModel> listVoucherModel;
  const ListVoucherContentView({required this.listVoucherModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listVoucherModel.length,
      padding: const EdgeInsets.only(top: 168, left: 16, right: 16),
      itemBuilder: (context, index) {
        return CardVoucherView(data: listVoucherModel[index]);
      },
    );
  }
}
