import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/change_profile/views/change_profile_form_view.dart';
import 'package:sertidemi/presentation/change_profile/views/change_profile_image_view.dart';

import 'controllers/change_profile.controller.dart';

class ChangeProfileScreen extends GetView<ChangeProfileController> {
  const ChangeProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'Edit Profile'),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          shrinkWrap: true,
          children: [
            ChangeProfileImageView(),
            const SizedBox(height: 40),
            ChangeProfileFormView(),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () => controller.buttonSave(),
                child: Text(
                  'Save',
                  style: textBold.copyWith(color: Colors.white),
                ))
          ],
        ));
  }
}
