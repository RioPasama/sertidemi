import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/providers/Re_register_account_provider.dart';

class VerificationEmailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEditingController;

  @override
  void onInit() {
    emailTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
  }

  String? validatorEmail(String? val) {
    if (val!.contains(' ')) {
      return 'Your email uses spaces';
    }
    return (GetUtils.isEmail(val)) ? null : 'Please check your email again';
  }

  void onTapReSendEmail() async {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }
    String result = await ReRegisterAccount.postReRegisterAccount(
        emailTextEditingController.text);

    Get.dialog(AlertDialog(
      content: Text(result),
    ));
  }
}
