import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/assessment_detail_tiket_model.dart';
import 'package:sertidemi/app/data/models/assessment_tiket_model.dart';
import 'package:sertidemi/app/data/models/event_tiket_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class TiketProvider {
  static Future<List<AssessmentTiketModel>> getMyAssessment() async {
    MainModel result = await MainProvider.getAPI(
        url: 'myassessment.php', body: {'iduser': GetStorage().read('idUser')});

    return List<AssessmentTiketModel>.from(
        result.data.map((e) => AssessmentTiketModel.fromJson(e)));
  }

  static Future<AssessmentDetailTiketModel> getDetailMyAssessment(
      {required String idtransaksi}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'myassessment.php',
        body: {
          'iduser': GetStorage().read('idUser'),
          'idtransaksi': idtransaksi
        });

    return AssessmentDetailTiketModel.fromJson(result.data);
  }

  static Future<List<EventTiketModel>> getMyEvent() async {
    MainModel result = await MainProvider.getAPI(
        url: 'myevent.php', body: {'iduser': GetStorage().read('idUser')});

    return List<EventTiketModel>.from(
        result.data.map((e) => EventTiketModel.fromJson(e)));
  }
}
