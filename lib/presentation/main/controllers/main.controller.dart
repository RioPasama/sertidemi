import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_home_controller.dart';

class MainController extends GetxController {
  final FetchAPIHomeController fetchAPIHomeController =
      Get.put(FetchAPIHomeController());

  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    fetchAPIHomeController.fetchHomeListProduct();
    fetchAPIHomeController.fetchHomeCategoryMaster();
    fetchAPIHomeController.fetchHomeBanner();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
