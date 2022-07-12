import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_detail_tiket_model.dart';
import 'package:sertidemi/app/data/models/questions_multiple_choice_model.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class StartAssessmentController extends GetxController {
  late RxList<QuestionsMultipleChoiceModel> questionsMultipleChoiceModel =
      RxList<QuestionsMultipleChoiceModel>();
  late Rxn<AssessmentDetailTiketModel> assessmentDetailModel =
      Rxn<AssessmentDetailTiketModel>();

  Map<String, dynamic> getArguments = Get.arguments;

  @override
  void onInit() {
    assessmentDetailModel = getArguments['assessmentDetailModel'];
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

  void onTapStart() {
    int jumSoal =
        (int.parse(assessmentDetailModel.value!.tampilAssessmentEssay!) +
            int.parse(assessmentDetailModel.value!.tampilAssessmentPilgan!));

    Map<String, dynamic> sendArguments = {
      'jumSoal': jumSoal,
      'waktuPengerjaan': assessmentDetailModel.value!.waktuPengerjaan,
      'titleAppBar': assessmentDetailModel.value!.namaAssessment,
      'idAssessment': assessmentDetailModel.value!.idassessment,
      'questionsMultipleChoiceModel': questionsMultipleChoiceModel,
      'idTransaksi': assessmentDetailModel.value!.idtransaksi,
    };

    Get.toNamed(Routes.QUESTIONS_MULTIPLE_CHOICE, arguments: sendArguments);
  }
}
