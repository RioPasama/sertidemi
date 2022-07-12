import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class TransactionProvider {
  static Future<StatusTransactionModel> postEventTransaction(
      {required String idevent,
      required String totalbayar,
      String statusPayment = '0',
      String idvoucher = '',
      required String namaSertifikat}) async {
    dynamic result =
        await MainProvider.postAPI(url: 'event_transaction.php', body: {
      'iduser': GetStorage().read('idUser'),
      'idevent': idevent,
      'totalbayar': totalbayar,
      'status_payment': statusPayment,
      'idvoucher': idvoucher,
      'nama_sertifikat': namaSertifikat
    });

    return StatusTransactionModel.fromJson(result.data);
  }

  static Future<StatusTransactionModel> postAssessmentTransaction(
      {required String idevent,
      required String totalbayar,
      String statusPayment = '0',
      String idvoucher = '',
      required String namaSertifikat}) async {
    dynamic result =
        await MainProvider.postAPI(url: 'assessment_transaction.php', body: {
      'iduser': GetStorage().read('idUser'),
      'idassessment': idevent,
      'totalbayar': totalbayar,
      'status_payment': statusPayment,
      'idvoucher': idvoucher,
      'nama_sertifikat': namaSertifikat
    });

    return StatusTransactionModel.fromJson(result.data);
  }
}
