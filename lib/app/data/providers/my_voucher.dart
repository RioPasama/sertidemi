import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class MyVoucherProvider {
  static Future<List<ListVoucherAllProductModel>> getMyListVoucher() async {
    MainModel result = await MainProvider.getAPI(
        url: 'voucher_mandiri_user.php',
        body: {'iduser': GetStorage().read('idUser')});

    return List<ListVoucherAllProductModel>.from(
        result.data.map((e) => ListVoucherAllProductModel.fromJson(e)));
  }
}
