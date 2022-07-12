import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';

class TiketDetailEventController extends GetxController {
  final FetchAPIProductDetailsController fetchAPIProductDetailsController =
      Get.put(FetchAPIProductDetailsController());

  Map<String, dynamic> getArguments = Get.arguments;

  @override
  void onInit() {
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
}
