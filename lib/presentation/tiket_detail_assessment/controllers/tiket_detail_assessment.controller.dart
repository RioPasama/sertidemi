import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/asessment_answer_model.dart';
import 'package:sertidemi/app/data/models/assessment_detail_tiket_model.dart';
import 'package:sertidemi/app/data/models/assessment_materi_model.dart';
import 'package:sertidemi/app/data/providers/asessment_answer_provider.dart';
import 'package:sertidemi/app/data/providers/assessment_materi_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class TiketDetailAssessmentController extends GetxController {
  late RxList<AssessmentMateriModel> assessmentMateriTextModel =
      RxList<AssessmentMateriModel>();
  late RxList<AssessmentMateriModel> assessmentMateriVideoModel =
      RxList<AssessmentMateriModel>();
  late Rxn<AssessmentDetailTiketModel> assessmentDetailModel =
      Rxn<AssessmentDetailTiketModel>();
  late Rxn<AsessmentAnswerModel> asessmentAnswerModel =
      Rxn<AsessmentAnswerModel>();

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

  void onTapAssessment() {
    Map<String, dynamic> sendArguments = {
      'assessmentDetailModel': assessmentDetailModel
    };
    Get.toNamed(Routes.START_ASSESSMENT, arguments: sendArguments);
  }

  void loadListMateri() async {
    assessmentMateriTextModel.value =
        await AssessmentMateriProvider.getAssessmentMateriTextList(
            id: assessmentDetailModel.value!.idassessment!);

    assessmentMateriVideoModel.value =
        await AssessmentMateriProvider.getAssessmentMateriVideoList(
            id: assessmentDetailModel.value!.idassessment!);
  }

  void onTapMateri() {
    Map<String, dynamic> sendArguments = {
      'titleHeader': 'Sertifikasi',
      'assessmentMateriTextModel': assessmentMateriTextModel,
      'assessmentMateriVideoModel': assessmentMateriVideoModel
    };

    Get.toNamed(Routes.MATERI, arguments: sendArguments);
  }

  void onTapResult() async {
    asessmentAnswerModel.value =
        await AsessmentAnswerProvider.getAssessmentResult(
            assessmentDetailModel.value!.idassessment!,
            assessmentDetailModel.value!.idtransaksi!);

    if (asessmentAnswerModel.value!.idAssessment != '') {
      Get.offNamed(Routes.FINISH_ASSESSMENT, arguments: asessmentAnswerModel);
    }
  }
}
