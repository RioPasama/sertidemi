import 'package:get/get.dart';

import '../models/tesapi_model.dart';

class TesapiProvider extends GetConnect {
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Tesapi.fromJson(map);
  //     if (map is List) return map.map((item) => Tesapi.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'YOUR-API-URL';
  // }

  Future<Tesapi?> getTesapi(int id) async {
    final response = await get('tesapi/$id');
    return response.body;
  }

  Future<Response<Tesapi>> postTesapi(Tesapi tesapi) async =>
      await post('tesapi', tesapi);
  Future<Response> deleteTesapi(int id) async => await delete('tesapi/$id');
}
