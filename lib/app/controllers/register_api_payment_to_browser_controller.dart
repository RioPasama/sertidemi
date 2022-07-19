import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:sertidemi/app/views/views/loading_view.dart';

class RegisterApiPaymentToBrowserController extends GetxController {
  Future<String> postPaymentToBrowser(
      {required String idProduct,
      required String nameCertificate,
      required String status,
      http.Client? client}) async {
    Get.dialog(LoadingView(), barrierDismissible: false);
    client ??= http.Client();

    String url =
        'https://devsertidemi.andipublisher.com/manual_payment/index.php';
    log('id_user : ${GetStorage().read('idUser')}, id_produk : $idProduct, nama_sertifikat : $nameCertificate, status: $status');

    http.Response response = await client.post(Uri.parse(url), body: {
      'id_user': GetStorage().read('idUser'),
      'id_produk': idProduct,
      'nama_sertifikat': nameCertificate,
      'status': status
    });

    log('postPaymentToBrowser${response.body}');

    var data = json.decode(response.body);
    Get.back();
    return data['uri'];
  }

  static Future<String> postWaitingPaymentToBrowser(
      {required String idTransaksi, http.Client? client}) async {
    Get.dialog(LoadingView(), barrierDismissible: false);
    client ??= http.Client();
    String url =
        'https://devsertidemi.andipublisher.com/manual_payment/index.php';

    http.Response response = await client.post(Uri.parse(url), body: {
      'idtransaksi': idTransaksi,
    });

    log('postWaitingPaymentToBrowser${response.body}');

    var data = json.decode(response.body);
    Get.back();
    return data['uri'];
  }
}
