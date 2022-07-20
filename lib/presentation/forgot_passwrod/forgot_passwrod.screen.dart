import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';

import 'controllers/forgot_passwrod.controller.dart';

class ForgotPasswrodScreen extends GetView<ForgotPasswrodController> {
  ForgotPasswrodScreen({Key? key}) : super(key: key);
  @override
  final ForgotPasswrodController controller =
      Get.put(ForgotPasswrodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'Forgot Password'),
        body: ListView(
          children: [
            SizedBox(
              height: Get.height - 80,
              width: Get.width,
              child: Column(
                children: [
                  Container(
                    height: Get.height / 4,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                Assets.images.vektorLupaKataSandi.path))),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: textBold),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16, top: 8),
                          decoration: inputBoxDecorationRounded,
                          child: Form(
                            key: controller.formKey,
                            child: TextFormField(
                              controller: controller.emailTextEditingController,
                              decoration: inputInputDecorationRounded,
                              validator: (value) =>
                                  controller.validatorEmail(value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 8),
                  GestureDetector(
                    onTap: () => controller.onTapForgotPasswordEmail(),
                    child: Container(
                      height: 60,
                      width: Get.width,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      color: primaryColor,
                      child: Text(
                        'Forgot Password',
                        style: textBold.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
