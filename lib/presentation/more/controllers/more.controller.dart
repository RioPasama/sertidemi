import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/more_provider.dart';

class MoreController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxList<ProductModel> productModel = RxList<ProductModel>();
  int limit = 10;
  Map<String, dynamic> getArguments = Get.arguments;
  RxString title = ''.obs;

  @override
  void onInit() {
    title.value = getArguments['name'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void onScroll() async {
  //   double maxScroll = scrollController.position.maxScrollExtent;
  //   double currentScroll = scrollController.position.pixels;

  //   if (currentScroll == maxScroll) {
  //     productModel.value = await MoreProvider.getMoreDataList(
  //         url: getArguments['url'], body: {'tag': getArguments['body']});
  //     limit = limit * 2;
  //   }
  // }
}
