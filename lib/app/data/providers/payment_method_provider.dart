import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/payment_method_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class PaymentMethodProvider {
  static Future<List<PaymentMethodModel>> getListPaymentsMethod() async {
    MainModel result = await MainProvider.getAPI(url: 'payments.php');

    return List<PaymentMethodModel>.from(
        result.data.map((e) => PaymentMethodModel.fromJson(e)));
  }
}
