import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/providers/forgot_password._provider.dart';

class ForgotPasswrodController extends GetxController {
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
    super.onClose();
  }

  String? validatorEmail(String? val) {
    return (GetUtils.isEmail(val!)) ? null : 'Please check your email again';
  }

  void onTapForgotPasswordEmail() async {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }
    String result = await ForgotPassword.postForgotPassword(
        emailTextEditingController.text);

    Get.dialog(AlertDialog(
      content: Text(result),
    ));
  }
}
