import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/finish_assessment/controllers/finish_assessment.controller.dart';

class FinishAssessmentContentView extends GetView {
  FinishAssessmentContentView({Key? key}) : super(key: key);

  @override
  final FinishAssessmentController controller =
      Get.put(FinishAssessmentController());
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: controller.globalKey,
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Sertifikasi Berhasil',
                  style: textBold.copyWith(fontSize: 18),
                ),
              ),
              Image.asset(
                Assets.icons.vektorHasilNilaiMenuSertifikasi.assetName,
                scale: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icons.kelender.assetName,
                    scale: 4,
                  ),
                  Text(
                      ' ${timeFormatInCard(controller.asessmentAnswerModel.value!.submitAt!)} '),
                  Image.asset(
                    Assets.icons.transaksiJam.assetName,
                    scale: 4,
                  ),
                  Text(
                      ' ${clockFormat(controller.asessmentAnswerModel.value!.submitAt!)} WIB')
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Divider(thickness: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icons.transaksiJam.assetName,
                    scale: 2,
                  ),
                  Text(controller.asessmentAnswerModel.value!.duration!)
                ],
              ),
              Container(
                height: 200,
                width: Get.width - (16 * 2),
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Assets.images.transaksiBGDetailTransaksi,
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    const Text(
                      'Sertifikasi',
                      style: TextStyle(color: Colors.grey),
                      maxLines: 2,
                    ),
                    Text(
                      controller.asessmentAnswerModel.value!.namaAssessment!,
                      style: textBold.copyWith(fontSize: 18),
                      maxLines: 2,
                    ),
                    const Spacer(),
                    const Text(
                      'Nilai',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(controller.asessmentAnswerModel.value!.nilai!,
                        style: textBold),
                    Text(
                      controller.asessmentAnswerModel.value!.comment!,
                      style: textBold,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 80)
            ],
          ),
        ));
  }
}
