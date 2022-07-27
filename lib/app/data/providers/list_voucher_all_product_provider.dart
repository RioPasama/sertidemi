import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class ListVoucherAllProdutProvider {
  static Future<List<ListVoucherAllProductModel>> getListVoucher(
      {String q = ''}) async {
    MainModel result =
        await MainProvider.getAPI(url: 'voucher_mandiri.php', body: {'q': q});

    return List<ListVoucherAllProductModel>.from(
        result.data.map((e) => ListVoucherAllProductModel.fromJson(e)));
  }

  static Future<MainModel> postClaimVoucher({String idVoucher = ''}) async {
    MainModel result = await MainProvider.postAPI(
        url: 'voucher_klaim.php',
        body: {'idvoucher': idVoucher, 'iduser': GetStorage().read('idUser')});

    return result;
  }
}
