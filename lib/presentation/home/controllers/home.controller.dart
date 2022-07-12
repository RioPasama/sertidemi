import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_home_controller.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  final FetchAPIHomeController fetchAPIHomeController =
      Get.put(FetchAPIHomeController());
  final KlikContentController klikContentController =
      Get.put(KlikContentController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onKlikMore({required String name, required String url}) {
    Map<String, dynamic> sendArguments = {
      'name': name,
      'url': url.split('?').first,
      'body': url.split('?').last.split('=').last
    };

    Get.toNamed(Routes.MORE, arguments: sendArguments);
  }

  Future<void> onRefresh() async {
    fetchAPIHomeController.fetchHomeListProduct();
    fetchAPIHomeController.fetchHomeCategoryMaster();
    fetchAPIHomeController.fetchHomeBanner();
  }
}
