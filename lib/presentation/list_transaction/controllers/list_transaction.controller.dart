import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/data/models/list_transaction_model.dart';

class ListTransactionController extends GetxController {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  RxList<ListTransactionModel> listTransactionModel =
      RxList<ListTransactionModel>();

  @override
  void onInit() {
    authenticationControllercontroller.auth();
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
}
