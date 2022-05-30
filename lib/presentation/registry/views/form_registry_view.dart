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
            Text('Nama Lengkap', style: textBold),
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.fullNameTextEditingController,
                decoration: inputInputDecorationRounded,
              ),
            ),
            Text('Nomor Telepon', style: textBold),
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.phoneNumberTextEditingController,
                decoration: inputInputDecorationRounded,
              ),
            ),
            Text('Email', style: textBold),
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16, top: 8),
              decoration: inputBoxDecorationRounded,
              child: TextFormField(
                controller: controller.emailTextEditingController,
                decoration: inputInputDecorationRounded,
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
                      Text('Kata Sandi', style: textBold),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: inputBoxDecorationRounded,
                        child: TextFormField(
                          controller: controller.passwordTextEditingController,
                          decoration: inputInputDecorationRounded,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width / 2 - 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Konfirmasi Kata Sandi', style: textBold),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: inputBoxDecorationRounded,
                        child: TextFormField(
                          controller:
                              controller.confirmPasswordTextEditingController,
                          decoration: inputInputDecorationRounded,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
            TextFormField(
              controller: controller.referralCodeTextEditingController,
              decoration: const InputDecoration(
                  hintText: 'Masukan kode referal jika Anda punya'),
            ),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () {}, child: const Text('Daftar'))
          ],
        ));
  }
}
