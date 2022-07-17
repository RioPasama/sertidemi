import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/register_event/views/register_event_content_view.dart';

import 'controllers/register_event.controller.dart';

class RegisterEventScreen extends GetView<RegisterEventController> {
  @override
  final RegisterEventController controller = Get.put(RegisterEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Register Event'),
      body: RegisterEventContentView(),
      bottomSheet: GestureDetector(
        onTap: () => controller.onTapRegister(),
        child: Container(
          height: 60,
          width: Get.width,
          color: primaryColor,
          alignment: Alignment.center,
          child: Text(
            'Register',
            style: textBold.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
