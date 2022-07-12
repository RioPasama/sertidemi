import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'controllers/certificate.controller.dart';

class CertificateScreen extends GetView<CertificateController> {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Certificate'),
      body: SfPdfViewer.network(
        Get.arguments,
        controller: controller.pdfViewerController,
        key: controller.pdfViewerKey,
        enableTextSelection: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onTapDownload(),
        child: const Icon(Icons.download),
      ),
    );
  }
}
