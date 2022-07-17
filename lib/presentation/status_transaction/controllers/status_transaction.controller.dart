import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

import 'package:sertidemi/app/data/models/status_transaction_model.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:share_plus/share_plus.dart';

class StatusTransactionController extends GetxController {
  late StatusTransactionModel statusTransactionModel =
      Get.arguments['statusTransactionModel'];

  final GlobalKey globalKey = GlobalKey();

  RxString nameOption = ''.obs;

  @override
  void onInit() {
    nameOption.value = Get.arguments['nameOption'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTapShare() async {
    Uint8List pngBytes = await capturePng();

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/Status Transaksi.jpg';

    File(path).writeAsBytesSync(pngBytes);

    Share.shareFiles([path],
        text:
            'Thankyou for your registration to Sertidemi Certification.\n\nPlease save this reciepe as a sign proof that your transaction has been success. Here are your reciepe:\n\nName: ${Get.arguments['nameUser']}\n${nameOption.value}: ${statusTransactionModel.namaProduct}\nTotal Amount: ${currencyRp(statusTransactionModel.total)}\nInvoice Number: ${statusTransactionModel.noInvoice}\n\n\nThankyou.');
  }

  Future<Uint8List> capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    return pngBytes;
  }
}
