import 'package:sertidemi/app/data/models/list_voucher_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ListVoucherProvider {
  static Future<List<ListVoucherModel>> getListVoucher(
      {String filter = '', String q = ''}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'voucher.php', body: {'tag': 'profile', 'filter': filter, 'q': q});

    return List<ListVoucherModel>.from(
        result.data.map((e) => ListVoucherModel.fromJson(e)));
  }
}
