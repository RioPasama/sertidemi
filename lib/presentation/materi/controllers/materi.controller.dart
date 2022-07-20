import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sertidemi/app/data/models/materi_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriController extends GetxController {
  RxList<MateriModel> materiModel = RxList<MateriModel>();
  Map<String, dynamic> getArguments = Get.arguments;

  RxInt indexCategoryMateri = 0.obs;
  RxDouble progress = 0.0.obs;
  RxBool isSertifikasi = true.obs;
  RxBool isEmptyData = false.obs;

  @override
  void onInit() {
    initialModel();
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
    materiModel.clear();
    indexCategoryMateri.value = index;
  }

  void initialModel() {
    switch (getArguments['titleHeader']) {
      case 'Event':
        isSertifikasi.value = false;
        break;
      case 'Sertifikasi':
        isSertifikasi.value = true;
        break;
      default:
    }
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
