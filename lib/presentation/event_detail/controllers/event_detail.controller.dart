import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class EventDetailController extends GetxController {
  final FetchAPIProductDetailsController fetchAPIProductDetailsController =
      Get.put(FetchAPIProductDetailsController());

  Map<String, dynamic> getArguments = Get.arguments;
  RxBool isOnTapRegistry = false.obs;

  @override
  void onInit() {
    isOnTapRegistry.value = false;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTapRegistry() {
    if (!isOnTapRegistry.value) {
      return;
    }
    Get.toNamed(Routes.REGISTER_EVENT);
  }
}
