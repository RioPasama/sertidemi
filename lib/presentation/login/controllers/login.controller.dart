import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';

class LoginController extends GetxController {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());

  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  void login() {
    authenticationControllercontroller.login(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text);
  }
}
