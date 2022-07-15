import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/list_assessment_certificate_model.dart';
import 'package:sertidemi/app/data/models/list_event_certificate_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ListCertificateProvider {
  static Future<List<ListAssessmentCertificateModel>>
      getAssessmentListCertificate() async {
    MainModel result = await MainProvider.getAPI(
        url: 'myassessment_certified.php',
        body: {'iduser': GetStorage().read('idUser')});

    return List<ListAssessmentCertificateModel>.from(
        result.data.map((e) => ListAssessmentCertificateModel.fromJson(e)));
  }

  static Future<List<ListEventCertificateModel>>
      getEventListCertificate() async {
    MainModel result = await MainProvider.getAPI(
        url: 'myevent_certified.php',
        body: {'iduser': GetStorage().read('idUser')});

    return List<ListEventCertificateModel>.from(
        result.data.map((e) => ListEventCertificateModel.fromJson(e)));
  }
}
