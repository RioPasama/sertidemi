import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/list_certificate_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ListCertificateProvider {
  static Future<List<ListCertificateModel>> getListCertificate() async {
    MainModel result = await MainProvider.getAPI(
        url: 'myassessment_certified.php',
        body: {'iduser': GetStorage().read('idUser')});

    return List<ListCertificateModel>.from(
        result.data.map((e) => ListCertificateModel.fromJson(e)));
  }
}
