import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/data/providers/list_voucher_all_product_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/presentation/list_voucher/views/voucher_content_view.dart';

import 'controllers/voucher.controller.dart';

class VoucherScreen extends GetView<VoucherController> {
  VoucherScreen({Key? key}) : super(key: key);

  @override
  final VoucherController controller = Get.put(VoucherController());
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    authenticationControllercontroller.authProfile();
    return Scaffold(
        appBar: appBarSearch(
          title: 'Voucher',
          leadingActive: false,
          txtEditingController: controller.searchtxtEditingController,
          onTap: () => controller.onSearch(),
        ),
        body: Stack(
          children: [
            Obx(
              () => (controller.isSearch.value)
                  ? FutureBuilder(
                      future: ListVoucherAllProdutProvider.getListVoucher(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          controller.listVoucherAllProductModel.value =
                              snapshot.data as List<ListVoucherAllProductModel>;

                          return VoucherContentView(
                            data: controller.listVoucherAllProductModel,
                          );
                        } else {
                          return Center(child: LoadingView());
                        }
                      },
                    )
                  : FutureBuilder(
                      future: ListVoucherAllProdutProvider.getListVoucher(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          controller.listVoucherAllProductModel.value =
                              snapshot.data as List<ListVoucherAllProductModel>;

                          return VoucherContentView(
                            data: controller.listVoucherAllProductModel,
                          );
                        } else {
                          return Center(child: LoadingView());
                        }
                      },
                    ),
            )
          ],
        ));
  }
}
