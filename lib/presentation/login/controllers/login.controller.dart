import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/data/providers/category_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

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

    while (authenticationControllercontroller.isLogin.value) {
      if (authenticationControllercontroller.isLogin.value) {
        Get.offAllNamed(Routes.MAIN);
      }
    }
  }

  String? validatorEmail(String? val) {
    return (GetUtils.isEmail(val!)) ? null : 'Silakan cek email anda kembali';
  }

  String? validatorPassword(String? val) {
    return (val!.length >= 6) ? null : 'Kata sandi min 6';
  }
}
