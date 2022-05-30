import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistryController extends GetxController {
  late TextEditingController fullNameTextEditingController;
  late TextEditingController phoneNumberTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  late TextEditingController referralCodeTextEditingController;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fullNameTextEditingController = TextEditingController();
    phoneNumberTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
    referralCodeTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    fullNameTextEditingController.dispose();
    phoneNumberTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    referralCodeTextEditingController.dispose();
  }
}
