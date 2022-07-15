import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/home_provider.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

class HomeSearchController extends GetxController {
  RxList<ProductModel> productModel = RxList<ProductModel>();
  RxBool isSearch = false.obs;

  @override
  void onInit() {
    isSearch.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
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
}
