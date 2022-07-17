import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';

import 'controllers/verification_email.controller.dart';

class VerificationEmailScreen extends GetView<VerificationEmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'Verifikasi'),
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
                    // decoration: BoxDecoration(image: DecorationImage(image: Assets.images.)),
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
                          child: TextField(
                            decoration: inputInputDecorationRounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 8),
                  Container(
                    width: Get.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.white,
                    child: const Text(
                        "Check you email and find verification email, if you doesn't receive that email, click this batton  below ti resend"),
                  ),
                  Container(
                    height: 60,
                    width: Get.width,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: primaryColor,
                    child: Text(
                      'Re-Send',
                      style:
                          textBold.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
