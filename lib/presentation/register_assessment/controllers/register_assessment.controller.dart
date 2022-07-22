import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';
import 'package:sertidemi/app/controllers/register_api_payment_to_browser_controller.dart';
import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/app/data/providers/transaction_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterAssessmentController extends GetxController {
  final FetchAPIProductDetailsController fetchAPIProductDetailsController =
      Get.put(FetchAPIProductDetailsController());
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  final RegisterApiPaymentToBrowserController registerAssessmentApiController =
      Get.put(RegisterApiPaymentToBrowserController());

  late TextEditingController nameTextEditingController;
  late StatusTransactionModel statusTransactionModel;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    authenticationControllercontroller.auth();
    nameTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameTextEditingController.dispose();
  }

  String? validatorName(String? val) {
    // return (GetUtils.isUsername(val!)) ? null : 'Silakan masukan Nama Lengkap';
    return (val!.length > 2) ? null : 'Please enter Full Name';
  }

  void onTapRegister() {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (fetchAPIProductDetailsController
            .assessmentDetailModel.value!.hargaAssessment
            .toString() ==
        '0') {
      freeTransaction();
    } else {
      transaction();
    }
  }

  void transaction() async {
    String url = await registerAssessmentApiController.postPaymentToBrowser(
        nameCertificate: nameTextEditingController.text,
        status: 'assessment',
        idProduct: fetchAPIProductDetailsController
            .assessmentDetailModel.value!.idAssessment!);
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        : log('cant open');

    Get.offAllNamed(Routes.MAIN);
    // CheckoutAssessmentDetailModel checkoutAssessmentDetailModel =
    //     await CheckoutProvider.postCheckouttAssessment(
    //         id: fetchAPIProductDetailsController
    //             .assessmentDetailModel.value!.idAssessment!);

    // if (checkoutAssessmentDetailModel.idAssessment!.isEmpty) {
    //   return;
    // }

    // Map<String, dynamic> sendArguments = {
    //   'nameOption': 'Certification',
    //   'nameUser': nameTextEditingController.text,
    //   'modelProductCheckout': checkoutAssessmentDetailModel
    // };
    // Get.toNamed(Routes.PAYMENT, arguments: sendArguments);
  }

  void freeTransaction() async {
    statusTransactionModel =
        await TransactionProvider.postAssessmentTransaction(
            idevent: fetchAPIProductDetailsController
                .assessmentDetailModel.value!.idAssessment!,
            totalbayar: fetchAPIProductDetailsController
                .assessmentDetailModel.value!.hargaAssessment!,
            statusPayment: '0',
            namaSertifikat: nameTextEditingController.text);

    if (statusTransactionModel.idTransaksi!.isEmpty) {
      return;
    }

    Map<String, dynamic> sendArguments = {
      'nameOption': 'Certification',
      'nameUser': nameTextEditingController.text,
      'statusTransactionModel': statusTransactionModel,
    };

    Get.offNamed(Routes.STATUS_TRANSACTION, arguments: sendArguments);
  }
}
