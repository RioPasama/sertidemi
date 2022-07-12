import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/controllers/fetch_a_p_i_product_details_controller.dart';
import 'package:sertidemi/app/data/models/checkout_event_model.dart';
import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/app/data/providers/checkout_provider.dart';
import 'package:sertidemi/app/data/providers/transaction_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class RegisterEventController extends GetxController {
  final FetchAPIProductDetailsController fetchAPIProductDetailsController =
      Get.put(FetchAPIProductDetailsController());
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());

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
    return (GetUtils.isUsername(val!)) ? null : 'Silakan masukan Nama Lengkap';
  }

  void onTapRegister() {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (fetchAPIProductDetailsController.eventDetailModel.value!.harga
            .toString() ==
        '0') {
      freeTransaction();
    } else {
      transaction();
    }
  }

  void transaction() async {
    CheckoutEventDetailModel checkoutEventDetailModel =
        await CheckoutProvider.postCheckoutEvent(
            id: fetchAPIProductDetailsController
                .eventDetailModel.value!.idEvent!);

    if (checkoutEventDetailModel.idEvent!.isEmpty) {
      return;
    }

    Map<String, dynamic> sendArguments = {
      'nameOption': 'Event',
      'nameUser': nameTextEditingController.text,
      'modelProductCheckout': checkoutEventDetailModel
    };
    Get.toNamed(Routes.PAYMENT, arguments: sendArguments);
  }

  void freeTransaction() async {
    statusTransactionModel = await TransactionProvider.postEventTransaction(
        idevent:
            fetchAPIProductDetailsController.eventDetailModel.value!.idEvent!,
        totalbayar:
            fetchAPIProductDetailsController.eventDetailModel.value!.harga,
        statusPayment: '0',
        namaSertifikat: nameTextEditingController.text);

    if (statusTransactionModel.idTransaksi!.isEmpty) {
      return;
    }

    Map<String, dynamic> sendArguments = {
      'nameOption': 'Event',
      'nameUser': nameTextEditingController.text,
      'statusTransactionModel': statusTransactionModel,
    };

    Get.offNamed(Routes.STATUS_TRANSACTION, arguments: sendArguments);
  }
}
