import 'dart:async';
import 'package:sertidemi/app/data/models/event_model.dart';
import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/main_provider.dart';

///Fetch data from api to model
class EventProvider {
  ///Fetch data getListAssesment
  static Future<List<ProductModel>> getListEvent(
      {String? q = '',
      int offset = 0,
      required String idaEventKategori,
      String tag = ''}) async {
    MainModel result = await MainProvider.getAPI(url: 'event.php', body: {
      'tag': tag,
      'limit': '20',
      'offset': offset.toString(),
      'id_kategori': idaEventKategori,
      'q': q,
    });

    return List<ProductModel>.from(
        result.data.map((e) => ProductModel.fromJson(e)));
  }

  ///Fetch data getDetailEvent
  static Future<EventDetailModel> getDetailEvent(
      {required String idEvent}) async {
    MainModel result = await MainProvider.getAPI(
        url: 'event.php', body: {'id_event': idEvent});

    return EventDetailModel.fromJson(result.data);
  }
}
