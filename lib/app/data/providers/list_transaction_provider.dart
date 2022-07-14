import 'package:sertidemi/app/data/models/list_transaction_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ListTransactionProvider {
  static Future<List<ListTransactionModel>> getAssessmentListTransactionModel(
      String id) async {
    MainModel result = await MainProvider.getAPI(
        url: 'transactions.php', body: {'tag': 'assessment', 'iduser': id});

    return List<ListTransactionModel>.from(
        result.data.map((e) => ListTransactionModel.fromJson(e)));
  }

  static Future<List<ListTransactionModel>> getEventListTransactionModel(
      String id) async {
    MainModel result = await MainProvider.getAPI(
        url: 'transactions.php', body: {'tag': 'event', 'iduser': id});

    return List<ListTransactionModel>.from(
        result.data.map((e) => ListTransactionModel.fromJson(e)));
  }
}
