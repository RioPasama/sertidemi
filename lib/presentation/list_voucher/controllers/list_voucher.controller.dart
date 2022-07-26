import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_model.dart';

class ListVoucherController extends GetxController {
  late RxList<ListVoucherModel> listVoucherModel = RxList<ListVoucherModel>();

  late TextEditingController search;
  RxBool isSearch = false.obs;

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }

  void onTapFilter() {}

  void onResetSearc() {}

  void onTapSearch(String value) {}
}
