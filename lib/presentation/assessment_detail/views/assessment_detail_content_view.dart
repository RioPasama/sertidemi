import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/assessment_detail/controllers/assessment_detail.controller.dart';

class AssessmentDetailContentView extends GetView {
  @override
  final AssessmentDetailController controller =
      Get.put(AssessmentDetailController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        // Header
        header(),

        const SizedBox(height: 10),

        //Aturan Pengerjaaan Soal
        questionRules(),

        const SizedBox(height: 10),

        //Deskripsi
        description(),

        const SizedBox(height: 10),

        // const Spacer(flex: 2),
      ],
    );
  }

  Container description() {
    return Container(
      // height: Get.height / 2.8,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // shrinkWrap: true,
        children: [
          Text(
            'Deskripsi',
            style: textBold.copyWith(fontSize: 16),
          ),
          Text(controller.fetchAPIProductDetailsController.assessmentDetailModel
              .value!.deskripsiAssessment!),
        ],
      ),
    );
  }

  Container questionRules() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aturan Pengerjaan Soal',
            style: textBold.copyWith(fontSize: 16),
          ),
          Text(
              'Duration Pengerjaan ${Duration(seconds: int.parse(controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.waktuPengerjaan!)).inHours}:${Duration(seconds: int.parse(controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.waktuPengerjaan!)).inMinutes.remainder(60)}:${Duration(seconds: int.parse(controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.waktuPengerjaan!)).inSeconds.remainder(60)}'),
          Text(
              '${int.parse(controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tampilAssessmentEssay!) + int.parse(controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tampilAssessmentPilgan!)} Soal'),
        ],
      ),
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width - (16 * 2) - (120),
                child: Text(
                  controller.fetchAPIProductDetailsController
                      .assessmentDetailModel.value!.namaAssessment!,
                  style: textBold.copyWith(fontSize: 18),
                ),
              ),
              Visibility(
                visible: controller.fetchAPIProductDetailsController
                        .assessmentDetailModel.value!.statusMateri ==
                    'Y',
                child: ElevatedButton(
                    onPressed: () => controller.onTapMateri(controller
                        .fetchAPIProductDetailsController
                        .assessmentDetailModel
                        .value!
                        .idAssessment!),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons
                              .menuSertifikasiBagianSertifikasiIconMateri.path,
                          scale: 4,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Materi',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )
                      ],
                    )),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.icons.kelender.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Mulai    : ${controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tanggalMulaiAssessment!} WIB'),
                  Text(
                      'Selesai  : ${controller.fetchAPIProductDetailsController.assessmentDetailModel.value!.tanggalBatasAssessment!} WIB'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.icons.iconPenulis.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Text(controller.fetchAPIProductDetailsController
                  .assessmentDetailModel.value!.penulis!)
            ],
          ),
        ],
      ),
    );
  }
}
