import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/event_provider.dart';

class EventListController extends GetxController {
  final ScrollController scrollController = ScrollController();

  late RxList<ProductModel> productModel = RxList<ProductModel>();
  late TextEditingController search;

  Map<String, dynamic> getArguments = Get.arguments;
  RxBool isSearch = false.obs;
  int limit = 10;

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
    isSearch.value = true;
  }

  void onRessetSearch() async {
    productModel.value = await EventProvider.getListEvent(
        idaEventKategori: getArguments['idkategori']);
    search.text = '';
    isSearch.value = false;
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      List<ProductModel> onScrollProductModel =
          await EventProvider.getListEvent(
              idaEventKategori: getArguments['idkategori'], offset: limit);

      productModel.value += onScrollProductModel;
      limit = limit * 2;
    }
  }
}
