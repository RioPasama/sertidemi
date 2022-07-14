import 'dart:developer';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/checkout_assessment_model.dart';
import 'package:sertidemi/app/data/models/checkout_event_model.dart';
import 'package:sertidemi/app/data/models/materi_model.dart';
import 'package:sertidemi/app/data/providers/checkout_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class KlikContentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onKlikCategory({int index = 0, int option = 1}) {
    Map<String, dynamic> sendArguments = {
      'index': index,
      'option': option,
    };

    Get.toNamed(Routes.LIST_CATEGORY, arguments: sendArguments);
  }

  void onTapTiketAssessment(String? idTransaksi) {
    Map<String, dynamic> sendArguments = {'idTransaksi': idTransaksi};

    Get.toNamed(Routes.TIKET_DETAIL_ASSESSMENT, arguments: sendArguments);
  }

  void onTapTiketEvent(String? idEvent) {
    Map<String, dynamic> sendArguments = {'idProduct': idEvent};

    Get.toNamed(Routes.TIKET_DETAIL_EVENT, arguments: sendArguments);
  }

  void onTapTiketEventLink(String link) async {
    await canLaunchUrl(Uri.parse(link))
        ? launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication)
        : log('can`t not luanch');
  }

  void onTapTiketEventMateri(String idProduct) {
    Map<String, dynamic> sendArguments = {
      'titleHeader': 'Event',
      'idProduct': idProduct
    };
    Get.toNamed(Routes.MATERI, arguments: sendArguments);
  }

  void onTapTiketEventToAssesment({required String idProduct}) {
    Map<String, dynamic> sendArguments = {
      'idProduct': idProduct,
      'urlImageCover': ''
    };

    Get.toNamed(Routes.ASSESSMENT_DETAIL, arguments: sendArguments);
  }

  void onTapUseVoucher() async {}

  void onTapCardProduct(
      {required String idProduct,
      required String urlImageCover,
      required String status}) {
    Map<String, dynamic> sendArguments = {
      'idProduct': idProduct,
      'urlImageCover': urlImageCover
    };

    switch (status) {
      case 'assessment':
        Get.toNamed(Routes.ASSESSMENT_DETAIL, arguments: sendArguments);
        break;
      case 'event':
        Get.toNamed(Routes.EVENT_DETAIL, arguments: sendArguments);
        break;
      default:
    }
  }

  void onTapIconCategroy(
      {required String idkategori,
      required String title,
      required int option}) {
    Map<String, dynamic> sendArguments = {
      'idkategori': idkategori,
      'title': title
    };

    switch (option) {
      case 1:
        Get.toNamed(Routes.EVENT_LIST, arguments: sendArguments);
        break;
      case 2:
        Get.toNamed(Routes.ASSESSMENT_LIST, arguments: sendArguments);
        break;
      default:
    }
  }
}