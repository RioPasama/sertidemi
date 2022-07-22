import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/home_provider.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

class HomeSearchController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxList<ProductModel> productModel = RxList<ProductModel>();
  late TextEditingController searchTextEditingController;
  RxBool isSearch = false.obs;
  int limit = 10;

  @override
  void onInit() {
    searchTextEditingController = TextEditingController();
    isSearch.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchTextEditingController.dispose();
    super.onClose();
  }

  void onSubmitted(String value) async {
    if (value == '') {
      return;
    }
    Get.dialog(LoadingView(), barrierDismissible: false);
    productModel.value = await HomeProvider.getHomeSearch(value, '0');
    Get.back();
    isSearch.value = true;
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      List<ProductModel> onScrollProductModel =
          await HomeProvider.getHomeSearch(
              searchTextEditingController.text, '$limit');

      productModel.value += onScrollProductModel;
      limit = limit * 2;
    }
  }
}
