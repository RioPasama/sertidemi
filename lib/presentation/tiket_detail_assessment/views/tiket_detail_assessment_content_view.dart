import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/tiket_detail_assessment/controllers/tiket_detail_assessment.controller.dart';

class TiketDetailAssessmentContentView extends GetView {
  TiketDetailAssessmentContentView({Key? key}) : super(key: key);

  @override
  final TiketDetailAssessmentController controller =
      Get.put(TiketDetailAssessmentController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      shrinkWrap: true,
      children: [
        // Header
        header(),

        const Spacer(flex: 1),

        //Deskripsi
        description(),

        const Spacer(flex: 1),

        //Peyedia Sertifikat
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            'Penyedia Sertifikat',
            style: textBold.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount:
                  controller.assessmentDetailModel.value!.contribution!.length,
              itemBuilder: (context, index) {
                return imageContribution(controller
                    .assessmentDetailModel.value!.contribution![index].icon);
              },
            )),

        const Spacer(flex: 2),
      ],
    );
  }

  Widget imageContribution(url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration:
                BoxDecoration(image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        });
  }

  Container description() {
    return Container(
      height: Get.height / 2.8,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: ListView(
        children: [
          Text(
            'Deskripsi',
            style: textBold.copyWith(fontSize: 16),
          ),
          Text(controller.assessmentDetailModel.value!.deskripsiAssessment!),
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
                  controller.assessmentDetailModel.value!.namaAssessment!,
                  style: textBold.copyWith(fontSize: 18),
                ),
              ),
              Obx(() => Visibility(
                    visible:
                        (controller.assessmentDetailModel.value!.statusMateri ==
                            'Y'),
                    child: ElevatedButton(
                        onPressed: () => controller.onTapMateri(),
                        child: Row(
                          children: [
                            Image.asset(
                              Assets
                                  .icons
                                  .menuSertifikasiBagianSertifikasiIconMateri
                                  .assetName,
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
                  ))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.icons.kelender.assetName,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Mulai    : ${controller.assessmentDetailModel.value!.tanggalMulaiAssessment!} WIB'),
                  Text(
                      'Selesai  : ${controller.assessmentDetailModel.value!.tanggalBatasAssessment!} WIB'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.icons.iconPenulis.assetName,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Text(controller.assessmentDetailModel.value!.penulis!)
            ],
          ),
          Row(
            children: [
              const Text('Status :'),
              const SizedBox(width: 10),
              (controller.assessmentDetailModel.value!.statusLulus !=
                      'Sudah Mengerjakan')
                  ? Text(
                      controller.assessmentDetailModel.value!.statusLulus!,
                      style: const TextStyle(color: Colors.red),
                    )
                  : Text(
                      controller.assessmentDetailModel.value!.statusLulus!,
                      style: const TextStyle(color: Colors.green),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
