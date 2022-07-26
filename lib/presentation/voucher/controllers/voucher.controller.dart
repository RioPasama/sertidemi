import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/data/providers/list_voucher_all_product_provider.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

class VoucherController extends GetxController {
  late RxList<ListVoucherAllProductModel> listVoucherAllProductModel =
      RxList<ListVoucherAllProductModel>();
  late TextEditingController searchtxtEditingController;

  @override
  void onInit() {
    searchtxtEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchtxtEditingController.dispose();
    super.onClose();
  }

  void onSearch() async {
    Get.dialog(LoadingView(), barrierDismissible: false);
    listVoucherAllProductModel.value =
        await ListVoucherAllProdutProvider.getListVoucher(
            q: searchtxtEditingController.text);
    Get.back();
  }
}
