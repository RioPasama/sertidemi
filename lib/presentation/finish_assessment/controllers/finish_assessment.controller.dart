import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/data/models/asessment_answer_model.dart';
import 'package:share_plus/share_plus.dart';

class FinishAssessmentController extends GetxController {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  late Rxn<AsessmentAnswerModel> asessmentAnswerModel =
      Rxn<AsessmentAnswerModel>();

  final GlobalKey globalKey = GlobalKey();

  @override
  void onInit() {
    asessmentAnswerModel = Get.arguments;
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

  void onTapShare() async {
    Uint8List pngBytes = await capturePng();

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/Status Transaksi.jpg';

    File(path).writeAsBytesSync(pngBytes);

    Share.shareFiles([path],
        text:
            "Thank you for your participation in the assessment of Sertidemi certification. Here are the results you'll get: \n\nName of the participant : ${asessmentAnswerModel.value?.namaUser ?? ''}\nName on the certificate :${asessmentAnswerModel.value?.namaSertifikat ?? ''} \nCertification : ${asessmentAnswerModel.value?.namaAssessment ?? ''}\nCertification date : ${asessmentAnswerModel.value?.submitAt ?? ''}\nResult : ${asessmentAnswerModel.value?.hasil ?? ''}\nScore : ${asessmentAnswerModel.value?.nilai ?? ''} \nGrade : ${asessmentAnswerModel.value!.comment}\n\n--------------------\n\nWe CONGRATULATE all of you who have successfully passed the assessment of this certification.\nAnd for you who have not achieved the desired result can retake the assessment as long as this certification is still available in the Sertidemi apps.\nThank you.\n\nThank you for your participation");
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
