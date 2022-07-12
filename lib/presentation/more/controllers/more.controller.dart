import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';

class MoreController extends GetxController {
  RxList<ProductModel> productModel = RxList<ProductModel>();

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
}
