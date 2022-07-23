import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_home_controller.dart';

class MainController extends GetxController {
  final FetchAPIHomeController fetchAPIHomeController =
      Get.put(FetchAPIHomeController());

  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    _checkVersion();
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

  void _checkVersion() async {
    final newVersion = NewVersion(androidId: 'com.ags.sertidemi');
    final status = await newVersion.getVersionStatus();

    if (status == null) {
      return;
    }

    if (status.canUpdate) {
      newVersion.showUpdateDialog(
          context: Get.context!,
          versionStatus: status,
          dialogText: status.releaseNotes,
          allowDismissal: false);
    }
  }
}
