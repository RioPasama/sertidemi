import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CertificateController extends GetxController {
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  PdfViewerController pdfViewerController = PdfViewerController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapDownload() async {
    await canLaunchUrl(Uri.parse(Get.arguments))
        ? launchUrl(Uri.parse(Get.arguments),
            mode: LaunchMode.externalApplication)
        : log("Can't open");
  }
}
