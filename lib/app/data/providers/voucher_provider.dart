import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/voucher_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class VoucherProvider {
  static Future<List<VoucherModel>> getVoucher({required String id}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'voucher.php', body: {'tag': 'transaction', 'id': id});

    return List<VoucherModel>.from(
        result.data.map((e) => VoucherModel.fromJson(e)));
  }
}
