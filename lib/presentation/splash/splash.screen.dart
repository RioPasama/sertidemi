import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(
          Assets.images.logoSertidemi512X512bPxPng.path,
        ),
      )),
    );
  }
}
