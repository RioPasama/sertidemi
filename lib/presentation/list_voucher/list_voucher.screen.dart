import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_model.dart';
import 'package:sertidemi/app/data/providers/list_voucher_provider.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/list_voucher/views/list_voucher_app_bar_view.dart';
import 'package:sertidemi/presentation/list_voucher/views/list_voucher_content_view.dart';

import 'controllers/list_voucher.controller.dart';

class ListVoucherScreen extends GetView<ListVoucherController> {
  const ListVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background
        Container(color: primaryColor),
        SafeArea(child: Container(color: Colors.white)),

        //Content
        FutureBuilder(
          future: ListVoucherProvider.getListVoucher(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.listVoucherModel.value =
                  snapshot.data as List<ListVoucherModel>;

              return ListVoucherContentView(
                  listVoucherModel: controller.listVoucherModel);
            } else {
              return Center(child: LoadingView());
            }
          },
        ),

        //AppBar
        ListVoucherAppBarView()
      ],
    ));
  }
}
