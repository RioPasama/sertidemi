import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/screens.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background
        Container(color: primaryColor.withOpacity(0.8)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height / 1.4,
            padding: const EdgeInsets.only(top: 28, left: 26, right: 26),
            width: Get.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Masuk',
                      style: textBold.copyWith(fontSize: 28),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Text('Email', style: textBold),
                  TextFormField(
                    controller: controller.emailTextEditingController,
                    decoration:
                        const InputDecoration(hintText: 'Nama@gmail.com'),
                  ),
                  const Spacer(flex: 1),
                  Text('Kata Sandi', style: textBold),
                  TextFormField(
                      controller: controller.passwordTextEditingController,
                      decoration: const InputDecoration(hintText: 'xxxxxx')),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => controller.login(),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(Get.width / 2 - 26, 40))),
                          child: const Text('Login')),
                      TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  unselectedWidgetColor),
                              textStyle: MaterialStateProperty.all(
                                  textBold.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))),
                          child: const Text('Lupa Password'))
                    ],
                  ),
                  const Spacer(flex: 2),
                  GestureDetector(
                    onTap: () => Get.to(() => RegistryScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Belum punya akun ?  ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Daftar',
                          style: textBold.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2),
                  GestureDetector(
                    onTap: () => Get.to(() => VerificationEmailScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verifikasi email ',
                          style:
                              textBold.copyWith(color: unselectedWidgetColor),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 80,
              width: 80,
              color: Colors.grey,
            ),
          ),
        )
      ],
    ));
  }
}
