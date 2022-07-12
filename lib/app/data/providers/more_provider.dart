import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

class MoreProvider {
  static Future<List<ProductModel>> getMoreDataList(
      {required String url, required Map<String, String> body}) async {
    MainModel result = await MainProvider.getAPI(url: url, body: body);

    return List<ProductModel>.from(
        result.data.map((e) => ProductModel.fromJson(e)));
  }
}
