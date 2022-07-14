import 'package:sertidemi/app/data/models/detail_transaction_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class DetailTransactionProvider {
  static Future<DetailTransactionModel> getAssessmentDetailTransaction(
      String idAssessmen) async {
    MainModel result = await MainProvider.getAPI(
        url: 'transactions.php',
        body: {'tag': 'assessment', 'id': idAssessmen});

    return DetailTransactionModel.fromJson(result.data);
  }

  static Future<DetailTransactionModel> getEventDetailTransaction(
      String idAssessmen) async {
    MainModel result = await MainProvider.getAPI(
        url: 'transactions.php', body: {'tag': 'event', 'id': idAssessmen});

    return DetailTransactionModel.fromJson(result.data);
  }
}
