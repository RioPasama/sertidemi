import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/registry/controllers/registry.controller.dart';

class FormRegistryView extends GetView {
  @override
  final RegistryController controller = Get.put(RegistryController());

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Text('Full Name', style: textBold),
            Container(
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.fullNameTextEditingController,
                keyboardType: TextInputType.text,
                decoration: inputInputDecorationRounded,
                validator: (val) => controller.validatorName(val),
              ),
            ),
            Text('Phone Number', style: textBold),
            Container(
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.phoneNumberTextEditingController,
                keyboardType: TextInputType.number,
                decoration: inputInputDecorationRounded,
                validator: (val) => controller.validatorPhoneNumber(val),
              ),
            ),
            Text('Email', style: textBold),
            Container(
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputInputDecorationRounded,
                validator: (val) => controller.validatorEmail(val),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 2 - 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password', style: textBold),
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: inputBoxDecorationRounded,
                          child: Obx(
                            () => TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller:
                                  controller.passwordTextEditingController,
                              obscureText: controller.passwordObscureText.value,
                              decoration: inputInputDecorationRounded.copyWith(
                                  suffixIcon: IconButton(
                                      onPressed: () => controller
                                          .passwordObscureText
                                          .toggle(),
                                      icon: Icon((!controller
                                              .passwordObscureText.value)
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                              validator: (val) =>
                                  controller.validatorPassword(val),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width / 2 - 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password Confirmation', style: textBold),
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          decoration: inputBoxDecorationRounded,
                          child: Obx(
                            () => TextFormField(
                              controller: controller
                                  .confirmPasswordTextEditingController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  controller.confirmPasswordObscureText.value,
                              decoration: inputInputDecorationRounded.copyWith(
                                  suffixIcon: IconButton(
                                      onPressed: () => controller
                                          .confirmPasswordObscureText
                                          .toggle(),
                                      icon: Icon((!controller
                                              .confirmPasswordObscureText.value)
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                              validator: (val) =>
                                  controller.validatorConfirmPassword(val),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: controller.referralCodeTextEditingController,
              decoration: const InputDecoration(
                  hintText: 'Input if you have referal code'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
                onPressed: () => controller.onTapDaftar(),
                child: const Text('Sign Up'))
          ],
        ));
  }
}
