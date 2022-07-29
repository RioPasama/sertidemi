import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sertidemi/app/data/data_data.dart';

import 'package:sertidemi/app/data/models/main_model.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/domain/core/extensions/apiErrorHandler.extension.dart';

///MainProvider serves to be the main Provider so all Providers
class MainProvider {
  ///getAPI berfungsi khusus untuk request method get
  ///
  ///* [url] is url initial path, no need to add scheme and host
  ///* [body] this variable  Map<String, dynamic>
  ///
  ///for example [body]:
  ///
  ///```
  /// MainModel result = await MainProvider.postAPI(url: 'login.php', body: {
  ///    'email_login': email,
  ///    'pass_login': password,
  ///  });
  ///```
  static Future<MainModel> getAPI(
      {required String url,
      Map<String, dynamic>? body,
      http.Client? client}) async {
    String queryString = Uri(queryParameters: body).query;
    String apiHttp = ('$urlApi$url?$queryString');
    dynamic res;
    try {
      final response = await http
          .get(Uri.parse(apiHttp))
          .timeout(const Duration(seconds: 50));

      log('Url: $apiHttp\nParams\n$body\n${response.body}');
      res = response;
      final result = jsonDecode(response.body);

      if (!(result['code'] == 200)) {
        throw '';
      }
      return MainModel.fromJson(result);
    } catch (e) {
      apiErrorHandler(res, e.toString());
      rethrow;
    }
  }

  ///postAPI berfungsi khusus untuk request method post
  ///
  ///* [url] is url initial path, no need to add scheme and host
  ///* [body] this variable  Map<String, dynamic>
  ///
  ///for example [body]:
  ///
  ///```
  ///  MainModel result = await MainProvider.getAPI(url: 'category.php', body: {
  ///    'id': 'assesment',
  ///    'q': q,
  ///  });
  ///```
  static Future<MainModel> postAPI(
      {required String url, Map? body, http.Client? client}) async {
    String apiHttp = urlApi + url;
    http.Response? res;
    client ??= http.Client();
    Get.dialog(LoadingView(), barrierDismissible: false);
    try {
      final response = await http
          .post(Uri.parse(apiHttp), body: body)
          .timeout(const Duration(seconds: 50));

      log('Url: $apiHttp\nBody\n$body\n${response.body}');

      res = response;
      final result = jsonDecode(response.body);

      if (!(result['code'] == 200)) {
        throw '';
      }
      Get.back();
      return MainModel.fromJson(result);
    } catch (e) {
      Get.back();
      apiErrorHandler(res, e.toString());
      rethrow;
    }
  }

  static Future<MainModel> postAPIBodyRaw(
      {required String url, Map? body, http.Client? client}) async {
    String apiHttp = urlApi + url;
    http.Response? res;
    client ??= http.Client();
    //encode Map to JSON
    var rawJson = json.encode(body);

    Get.dialog(LoadingView(), barrierDismissible: false);
    try {
      final response = await http
          .post(Uri.parse(apiHttp),
              headers: {"Content-Type": "application/json"}, body: rawJson)
          .timeout(const Duration(seconds: 20));

      log('Url: $apiHttp\nBody\n$body\n${response.body}');

      res = response;
      final result = jsonDecode(response.body);

      if (!(result['code'] == 200)) {
        throw '';
      }
      Get.back();
      return MainModel.fromJson(result);
    } catch (e) {
      Get.back();
      apiErrorHandler(res, e.toString());
      rethrow;
    }
  }

  ///postMultipartRequestAPI berfungsi khusus untuk request method post if you have files
  ///
  ///* [url] is url initial path, no need to add scheme and host
  ///* [request] this variable MultipartRequest
  ///
  ///for example :
  ///
  ///```
  ///   MainModel result = await MainProvider.postMultipartRequestAPI(
  ///      url: 'register.php',
  ///      request:
  ///          http.MultipartRequest('POST', Uri.parse('${urlApi}register.php'))
  ///            ..fields['email_login'] = email
  ///            ..fields['nama'] = name
  ///            ..fields['no_hp'] = phoneNumber
  ///            ..fields['alamat'] = address
  ///            ..fields['pass_login'] = password
  ///            ..fields['referal'] = referal ?? ''
  ///            ..files.add(await http.MultipartFile.fromPath(
  ///                'uploadedfile', imageProfile!.path)));
  ///```
  static Future<MainModel> postMultipartRequestAPI(
      {required String url,
      required http.MultipartRequest request,
      http.Client? client}) async {
    String apiHttp = urlApi + url;
    client ??= http.Client();
    http.Response? res;
    Get.dialog(LoadingView(), barrierDismissible: false);

    try {
      // var request = http.MultipartRequest('POST', Uri.parse(url));
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log('Url: $apiHttp\nBody\n$request\n${response.body}');

      res = response;
      final result = jsonDecode(response.body);

      if (!(result['code'] == 200)) {
        throw '';
      }

      Get.back();
      return MainModel.fromJson(result);
    } catch (e) {
      Get.back();
      apiErrorHandler(res, e.toString());
      rethrow;
    }
  }
}
