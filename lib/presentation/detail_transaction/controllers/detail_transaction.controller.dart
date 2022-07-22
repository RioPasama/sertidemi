import 'dart:developer';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/register_api_payment_to_browser_controller.dart';
import 'package:sertidemi/app/data/models/detail_transaction_model.dart';
import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/app/data/providers/registry_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTransactionController extends GetxController {
  Rxn<DetailTransactionModel> detailTransactionModel =
      Rxn<DetailTransactionModel>();

  RxString textButton = ''.obs;

  Map<String, dynamic> getArguments = Get.arguments;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initialTextButton() {
    switch (detailTransactionModel.value!.statusTransaksi!) {
      case 'Waiting For Payment':
        textButton.value = 'Continue Payment';
        break;
      case 'Waiting for Payment Verification':
        textButton.value = 'Reconfirm';
        break;
      case 'Payment Successfully':
        break;
      case 'Transaction Complete':
        textButton.value = 'View Receipt';
        break;
      case 'Received':
        break;
      case 'Payment declined':
        break;
      case 'Not defined':
        break;

      default:
    }
  }

  void onTapBottomSheet() {
    switch (detailTransactionModel.value!.statusTransaksi!) {
      case 'Waiting For Payment':
        waitingForPayment();
        break;
      case 'Waiting for Payment Verification':
        waitingforPaymentVerification();
        break;
      case 'Payment Successfully':
        break;
      case 'Transaction Complete':
        transactionDone();
        break;
      case 'Received':
        break;
      case 'Payment declined':
        break;
      case 'Not defined':
        break;

      default:
    }
  }

  void waitingForPayment() async {
    String url =
        await RegisterApiPaymentToBrowserController.postWaitingPaymentToBrowser(
            idTransaksi: detailTransactionModel.value!.idTransaksi!);

    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        : log('cant open');
  }

  void transactionDone() {
    StatusTransactionModel statusTransactionModel = StatusTransactionModel(
        idTransaksi: detailTransactionModel.value!.idTransaksi,
        noInvoice: detailTransactionModel.value!.invoice,
        namaProduct: detailTransactionModel.value!.nama,
        metodePembayaranal: detailTransactionModel.value!.paymentType,
        total: detailTransactionModel.value!.totalPembayaran,
        createdAt: detailTransactionModel.value!.tanggalInput);
    Map<String, dynamic> sendArguments = {
      'nameOption': 'Sertifikasi',
      'nameUser': detailTransactionModel.value!.namaSertifikat,
      'statusTransactionModel': statusTransactionModel,
    };
    Get.offNamed(Routes.STATUS_TRANSACTION, arguments: sendArguments);
  }

  void waitingforPaymentVerification() async {
    String url = await RegisterApiPaymentToBrowserController
        .postWaitingforPaymentVerification(
            idTransaksi: detailTransactionModel.value!.idTransaksi!);

    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        : log('cant open');
  }
}
