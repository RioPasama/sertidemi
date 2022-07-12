import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/asessment_answer_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class AsessmentAnswerProvider {
  static Future<AsessmentAnswerModel> postAsessmentAnswer(
      {required String idAssessment,
      required String duration,
      required String idTransaksi,
      required List<Map<String, dynamic>> saveAnswer}) async {
    Map<String, dynamic> body = {
      'iduser': GetStorage().read('idUser'),
      'idassessment': idAssessment,
      'idtransaksi': idTransaksi,
      'duration': duration,
      'answer': saveAnswer
    };

    MainModel result = await MainProvider.postAPIBodyRaw(
        url: 'assessment_answer.php', body: body);

    return AsessmentAnswerModel.fromJson(result.data);
  }

  static Future<AsessmentAnswerModel> getAssessmentResult(
      String idassessment, String idtransaksi) async {
    MainModel result =
        await MainProvider.getAPI(url: 'assessment_result.php', body: {
      'idassessment': idassessment,
      'idtransaksi': idtransaksi,
      'iduser': GetStorage().read('idUser')
    });

    return AsessmentAnswerModel.fromJson(result.data);
  }
}
