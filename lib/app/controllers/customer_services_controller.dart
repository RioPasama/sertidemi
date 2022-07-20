import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/data_data.dart';
import 'package:sertidemi/app/data/models/customer_services_model.dart';
import 'package:http/http.dart' as http;
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerServicesController extends GetxController {
  Future<CustomerServicesModel> getCustomerServices(
      {http.Client? client}) async {
    Get.dialog(LoadingView(), barrierDismissible: false);
    client ??= http.Client();
    String url = '${urlApi}callingcs.php';

    http.Response response = await client.post(
      Uri.parse(url),
    );

    log('getCustomerServices${response.body}');

    var data = json.decode(response.body);
    Get.back();
    return CustomerServicesModel.fromJson(data);
  }

  void onTapCustomerServices() async {
    CustomerServicesModel customerServicesModel = await getCustomerServices();
    await canLaunchUrl(Uri.parse(
            'https://wa.me/${customerServicesModel.nomorTelp!}?text=${customerServicesModel.message!}'))
        ? launchUrl(
            Uri.parse(
                'https://wa.me/${customerServicesModel.nomorTelp!}?text=${customerServicesModel.message!}'),
            mode: LaunchMode.externalApplication)
        : log('cant open');
  }
}
