import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sertidemi/app/data/providers/registry_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class RegistryController extends GetxController {
  late TextEditingController fullNameTextEditingController;
  late TextEditingController phoneNumberTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  late TextEditingController referralCodeTextEditingController;

  final formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxBool isInputImage = false.obs;
  RxBool passwordObscureText = true.obs;
  RxBool confirmPasswordObscureText = true.obs;
  RxString? pathImage = ''.obs;

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

  Future<XFile?> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    pathImage!.value = image!.path;
    isInputImage.value = true;
    return image;
  }

  String? validatorName(String? val) {
    return !(val!.length < 3) ? null : 'Please enter Full Name';
  }

  String? validatorPhoneNumber(String? val) {
    return (GetUtils.isPhoneNumber(val!))
        ? null
        : 'Make sure the number you entered is correct';
  }

  String? validatorEmail(String? val) {
    if (val!.contains(' ')) {
      return 'Your email uses spaces';
    }
    return (GetUtils.isEmail(val)) ? null : 'Please check your email again';
  }

  String? validatorPassword(String? val) {
    return (val!.length >= 6) ? null : 'Password min 6';
  }

  String? validatorConfirmPassword(String? val) {
    return (val! == passwordTextEditingController.text)
        ? null
        : 'Password is not the same';
  }

  void onTapDaftar() {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }

    //cek condition is input image or not
    if (isInputImage.value) {
      RegistryProvider.postRegistryAddImage(
              imageProfile: File(image?.path ?? ''),
              referal: referralCodeTextEditingController.text,
              email: emailTextEditingController.text,
              name: fullNameTextEditingController.text,
              phoneNumber: phoneNumberTextEditingController.text,
              address: '',
              password: passwordTextEditingController.text)
          .then((value) => Get.dialog(AlertDialog(
                title: const Center(child: Text('Sign Up')),
                content: SizedBox(
                  height: 170,
                  child: Column(
                    children: [
                      Text(value),
                      const Divider(),
                      TextButton(
                          onPressed: () => Get.offNamed(Routes.LOGIN),
                          child: const Text('OK'))
                    ],
                  ),
                ),
              )));
    } else {
      RegistryProvider.postRegistryNotImage(
              referal: referralCodeTextEditingController.text,
              email: emailTextEditingController.text,
              name: fullNameTextEditingController.text,
              phoneNumber: phoneNumberTextEditingController.text,
              address: '',
              password: passwordTextEditingController.text)
          .then((value) => Get.dialog(AlertDialog(
                title: const Center(child: Text('Sign Up')),
                content: SizedBox(
                  height: 170,
                  child: Column(
                    children: [
                      Text(value),
                      const Divider(),
                      TextButton(
                          onPressed: () => Get.offNamed(Routes.LOGIN),
                          child: const Text('OK'))
                    ],
                  ),
                ),
              )));
    }
  }
}
