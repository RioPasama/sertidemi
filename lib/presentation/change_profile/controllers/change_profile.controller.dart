import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/data/models/login_model.dart';
import 'package:sertidemi/app/data/providers/edit_profile_provider.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';

class ChangeProfileController extends GetxController {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());

  late TextEditingController fullNameTextEditingController;
  late TextEditingController phoneNumberTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;

  final formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;
  RxBool isInputImage = false.obs;
  RxString? pathImage = ''.obs;
  RxBool passwordObscureText = true.obs;
  RxBool confirmPasswordObscureText = true.obs;

  @override
  void onInit() {
    isInputImage.value = false;
    fullNameTextEditingController = TextEditingController(
        text: authenticationControllercontroller.nameUser.value);
    phoneNumberTextEditingController = TextEditingController(
        text: authenticationControllercontroller.telpUser.value);
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
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
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.onClose();
  }

  Future<XFile?> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    pathImage!.value = image!.path;
    isInputImage.value = true;
    return image;
  }

  String? validatorName(String? val) {
    // if (val == authenticationControllercontroller.nameUser.value) {
    //   return 'Nama anda masi sama';
    // }
    return (GetUtils.isUsername(val!)) ? null : 'Silakan masukan Nama Lengkap';
  }

  String? validatorPhoneNumber(String? val) {
    // if (val ==  authenticationControllercontroller.telpUser.value) {
    //   return 'Nomor telepon anda masi sama';
    // }
    return (GetUtils.isPhoneNumber(val!))
        ? null
        : 'Pastikan nomor yang anda masukan benar';
  }

  String? validatorPassword(String? val) {
    if (val == '') {
      return null;
    }
    return (val!.length >= 6) ? null : 'Kata sandi min 6';
  }

  String? validatorConfirmPassword(String? val) {
    return (val! == passwordTextEditingController.text)
        ? null
        : 'Kata sandi tidak sama';
  }

  void buttonSave() async {
    //cek validator
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (fullNameTextEditingController.text ==
            authenticationControllercontroller.nameUser.value &&
        phoneNumberTextEditingController.text ==
            authenticationControllercontroller.telpUser.value &&
        isInputImage.value == false) {
      Get.dialog(AlertDialog(
        title: const Text('Change profile'),
        content: const Text('Your data has not changed'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Back'))
        ],
      ));
      return;
    }

    //
    LoginModel resultLogin;
    if (!isInputImage.value) {
      resultLogin = await EditProfileProvider.postEditProfile(
          name: fullNameTextEditingController.text,
          telp: phoneNumberTextEditingController.text,
          imageProfile: File(image?.path ?? ''),
          pasLogin: confirmPasswordTextEditingController.text);
    } else {
      resultLogin = await EditProfileProvider.postEditProfileImage(
          name: fullNameTextEditingController.text,
          telp: phoneNumberTextEditingController.text,
          imageProfile: File(image?.path ?? ''),
          pasLogin: confirmPasswordTextEditingController.text);
    }

    authenticationControllercontroller.nameUser.value = resultLogin.nama!;
    authenticationControllercontroller.telpUser.value = resultLogin.telp!;
    authenticationControllercontroller.urlImageUser.value =
        resultLogin.urlImage!;

    GetStorage().write('nameUser', resultLogin.nama);
    GetStorage().write('telpUser', resultLogin.telp);
    GetStorage().write('urlImageUser', resultLogin.urlImage);

    Get.back();
  }
}
