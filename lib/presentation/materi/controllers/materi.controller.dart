import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sertidemi/app/data/models/assessment_materi_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriController extends GetxController {
  Map<String, dynamic> getArguments = Get.arguments;
  late RxList<AssessmentMateriModel> assessmentMateriTextModel =
      RxList<AssessmentMateriModel>();
  late RxList<AssessmentMateriModel> assessmentMateriVideoModel =
      RxList<AssessmentMateriModel>();

  RxInt indexCategoryMateri = 0.obs;
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    assessmentMateriTextModel = getArguments['assessmentMateriTextModel'];
    assessmentMateriVideoModel = getArguments['assessmentMateriVideoModel'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }

  void onTapMateri({required int index}) {
    indexCategoryMateri.value = index;
  }

  void requestDownload(String link, {required String namefile}) async {
    final status = await Permission.storage.request();

    String url = Uri.parse(link).toString();
    String savePath = await getFilePath(
        '$namefile (${DateTime.now().toString().replaceAll('.', '').replaceAll(':', '-')}).${(link.split('/').last).split('.').last}');
    if (status.isGranted) {
      try {
        Get.dialog(
            WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AlertDialog(
                title: const Text('Download'),
                content:
                    Obx(() => LinearProgressIndicator(value: progress.value)),
              ),
            ),
            barrierDismissible: false);
        await Dio().download(url, savePath, onReceiveProgress: ((count, total) {
          progress.value = count / total * 100;
        }));
        Get.back();
        progress.value == 0.0;
        Get.snackbar(
            'Download Success', 'Download Berhasil silakan cek file download',
            backgroundColor: Colors.white.withOpacity(0.8));
        return;
      } catch (e) {
        Get.dialog(AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
        ));
      }
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    path = '/storage/emulated/0/Download/$uniqueFileName';

    return path;
  }

  void onTapVideo(String url) async {
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          )
        : log("Can't open $url");
  }
}
