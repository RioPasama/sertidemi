import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/change_profile/controllers/change_profile.controller.dart';

class ChangeProfileFormView extends GetView {
  ChangeProfileFormView({Key? key}) : super(key: key);

  @override
  final ChangeProfileController controller = Get.put(ChangeProfileController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Text('Password', style: textBold),
          Container(
            margin: const EdgeInsets.only(bottom: 16, top: 8),
            decoration: inputBoxDecorationRounded,
            child: TextFormField(
              controller: controller.passwordTextEditingController,
              keyboardType: TextInputType.text,
              decoration: inputInputDecorationRounded,
              validator: (val) => controller.validatorPassword(val),
            ),
          ),
          Text('Password Confirmation', style: textBold),
          Container(
            margin: const EdgeInsets.only(bottom: 16, top: 8),
            decoration: inputBoxDecorationRounded,
            child: TextFormField(
              controller: controller.confirmPasswordTextEditingController,
              keyboardType: TextInputType.text,
              decoration: inputInputDecorationRounded,
              validator: (val) => controller.validatorConfirmPassword(val),
            ),
          ),
        ],
      ),
    );
  }
}
