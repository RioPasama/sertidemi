import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/questions_multiple_choice_model.dart';
import 'package:sertidemi/app/data/providers/questions_multiple_choice_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

import 'controllers/start_assessment.controller.dart';

class StartAssessmentScreen extends GetView<StartAssessmentController> {
  const StartAssessmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(
            title: controller.assessmentDetailModel.value!.namaAssessment!),
        body: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          children: [
            cardBanner(
                controller.assessmentDetailModel.value!.urlImagePanjang!),
            const SizedBox(height: 8),
            Text(
                'Mulai : ${timeFormatInCard(controller.assessmentDetailModel.value!.tanggalMulaiAssessment!)}, ${clockFormat(controller.assessmentDetailModel.value!.tanggalMulaiAssessment!)} WIB'),
            Text(
                'Selesai : ${timeFormatInCard(controller.assessmentDetailModel.value!.tanggalBatasAssessment!)}, ${clockFormat(controller.assessmentDetailModel.value!.tanggalBatasAssessment!)} WIB'),
            const SizedBox(height: 28),
            Text(
              controller.assessmentDetailModel.value!.namaAssessment!,
              style: textBold.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  Assets.icons.transaksiJam.path,
                  scale: 4,
                ),
                const SizedBox(width: 4),
                Text(
                    'Duration pengerjaan  ${Duration(seconds: int.parse(controller.assessmentDetailModel.value!.waktuPengerjaan!)).inHours}:${Duration(seconds: int.parse(controller.assessmentDetailModel.value!.waktuPengerjaan!)).inMinutes.remainder(60)}:${Duration(seconds: int.parse(controller.assessmentDetailModel.value!.waktuPengerjaan!)).inSeconds.remainder(60)}')
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset(
                  Assets.icons.iconJumlahSoal.path,
                  scale: 4,
                ),
                const SizedBox(width: 8),
                Text(
                    '${(int.parse(controller.assessmentDetailModel.value!.tampilAssessmentEssay!) + int.parse(controller.assessmentDetailModel.value!.tampilAssessmentPilgan!))} Soal')
              ],
            )
          ],
        ),
        bottomSheet: FutureBuilder(
          future: QuestionsMultipleChoiceProvider.getAssessmentQuestions(
              idassessment:
                  controller.assessmentDetailModel.value!.idassessment),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.questionsMultipleChoiceModel.value =
                  snapshot.data as List<QuestionsMultipleChoiceModel>;
              return GestureDetector(
                onTap: () => controller.onTapStart(),
                child: Container(
                  height: 60,
                  width: Get.width,
                  color: Colors.green.shade400,
                  alignment: Alignment.center,
                  child: Text(
                    'Start',
                    style: textBold.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
              );
            } else {
              return Container(
                height: 60,
                width: Get.width,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text(
                  'Please wait',
                  style: textBold.copyWith(color: Colors.white, fontSize: 16),
                ),
              );
            }
          },
        ));
  }

  Widget cardBanner(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        });
  }
}
