import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/data/providers/my_voucher.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/presentation/my_voucher/views/my_voucher_content_view.dart';

import 'controllers/my_voucher.controller.dart';

class MyVoucherScreen extends GetView<MyVoucherController> {
  const MyVoucherScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'My Voucher'),
        body: FutureBuilder(
          future: MyVoucherProvider.getMyListVoucher(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.listVoucherAllProductModel.value =
                  snapshot.data as List<ListVoucherAllProductModel>;
              if (controller.listVoucherAllProductModel.isNotEmpty) {
                return MyVoucherContentView();
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(Assets.lottie.emptydatanotfound),
                      const Center(child: Text('Data Not Found'))
                    ]);
              }
            } else {
              return Center(child: LoadingView());
            }
          },
        ));
  }
}
