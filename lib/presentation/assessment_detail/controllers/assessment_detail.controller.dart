import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class AssessmentDetailController extends GetxController {
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
  void onClose() {}

  void onTapMateri(String idProduct) {
    Map<String, dynamic> sendArguments = {
      'titleHeader': 'Sertifikasi',
      'idProduct': idProduct
    };

    Get.toNamed(Routes.MATERI, arguments: sendArguments);
  }

  void onTapRegistry() {
    Get.toNamed(Routes.REGISTER_ASSESSMENT);
  }
}
