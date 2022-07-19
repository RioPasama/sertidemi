import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Get.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.loginGambarCrop.path))),
          ),
        ),

        Container(color: Colors.white.withOpacity(0.8)),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Get.height / 4,
            width: Get.height / 4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.logoSertidemiPng.path))),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Get.height / 1.4,
                    padding:
                        const EdgeInsets.only(top: 28, left: 26, right: 26),
                    width: Get.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50))),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Login',
                              style: textBold.copyWith(fontSize: 28),
                            ),
                          ),
                          const Spacer(flex: 2),
                          Text('Email', style: textBold),
                          TextFormField(
                            controller: controller.emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: 'email@gmail.com'),
                            validator: (val) => controller.validatorEmail(val),
                          ),
                          const Spacer(flex: 1),
                          Text('Password', style: textBold),
                          TextFormField(
                            controller:
                                controller.passwordTextEditingController,
                            obscureText: true,
                            decoration:
                                const InputDecoration(hintText: 'xxxxxx'),
                            validator: (val) =>
                                controller.validatorPassword(val),
                          ),
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
                                  onPressed: () =>
                                      Get.toNamed(Routes.FORGOT_PASSWROD),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              unselectedWidgetColor),
                                      textStyle: MaterialStateProperty.all(
                                          textBold.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))),
                                  child: const Text('Forgot Password'))
                            ],
                          ),
                          const Spacer(flex: 2),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.REGISTRY),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Doesn't have account ? ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  'Sign up',
                                  style: textBold.copyWith(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.VERIFICATION_EMAIL),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verify email ',
                                  style: textBold.copyWith(
                                      color: unselectedWidgetColor),
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
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.icons.lingkaran.path))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.icons.loginBantuan.path,
                              scale: 4,
                            ),
                            const Text(
                              'Help',
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
