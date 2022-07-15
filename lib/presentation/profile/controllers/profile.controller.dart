import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  RxString versiApp = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTapAbout() {
    versionInfo();
    Get.dialog(Obx(
      () => AlertDialog(
        title: const Center(child: Text('About')),
        content: Text(
            'Sertidemi is a digital platform based on Android and iOS for everyone that looking for Digital Certification Assesment also enroll at Webinars event. You will get the link, assesment, also study materials from Sertidemi Apps.\n\n Version Apps : ${versiApp.value}',
            textAlign: TextAlign.justify),
      ),
    ));
  }

  void onTapPrivacyPolicy() async {
    String url =
        'https://devsertidemi.andipublisher.com/api/privacy_policy.html';
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : log('message');
  }

  Future<void> versionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versiApp.value = packageInfo.version;
  }
}
