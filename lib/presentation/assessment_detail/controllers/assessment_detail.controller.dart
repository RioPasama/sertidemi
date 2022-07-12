import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';
import 'package:sertidemi/app/data/models/assessment_materi_model.dart';
import 'package:sertidemi/app/data/providers/assessment_materi_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class AssessmentDetailController extends GetxController {
  final FetchAPIProductDetailsController fetchAPIProductDetailsController =
      Get.put(FetchAPIProductDetailsController());

  late RxList<AssessmentMateriModel> assessmentMateriTextModel =
      RxList<AssessmentMateriModel>();
  late RxList<AssessmentMateriModel> assessmentMateriVideoModel =
      RxList<AssessmentMateriModel>();

  Map<String, dynamic> getArguments = Get.arguments;
  RxBool showButtonMateri = false.obs;

  @override
  void onInit() {
    loadListMateri();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTapMateri() {
    Map<String, dynamic> sendArguments = {
      'titleHeader': 'Sertifikasi',
      'assessmentMateriTextModel': assessmentMateriTextModel,
      'assessmentMateriVideoModel': assessmentMateriVideoModel
    };

    Get.toNamed(Routes.MATERI, arguments: sendArguments);
  }

  void loadListMateri() async {
    assessmentMateriTextModel.value =
        await AssessmentMateriProvider.getAssessmentMateriTextList(
            id: getArguments['idProduct']);

    assessmentMateriVideoModel.value =
        await AssessmentMateriProvider.getAssessmentMateriVideoList(
            id: getArguments['idProduct']);

    if (assessmentMateriTextModel.isNotEmpty ||
        assessmentMateriVideoModel.isNotEmpty) {
      showButtonMateri.value = true;
    }
  }

  void onTapRegistry() {
    Get.toNamed(Routes.REGISTER_ASSESSMENT);
  }
}
