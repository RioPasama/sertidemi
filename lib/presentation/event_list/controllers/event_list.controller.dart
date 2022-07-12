import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/event_provider.dart';

class EventListController extends GetxController {
  late RxList<ProductModel> productModel = RxList<ProductModel>();
  late TextEditingController search;

  Map<String, dynamic> getArguments = Get.arguments;

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
    productModel.value = [];
  }

  void onTapSearch(String value) async {
    productModel.value = await EventProvider.getListEvent(
      idaEventKategori: getArguments['idkategori'],
      offset: 0,
      q: value,
    );
  }
}
