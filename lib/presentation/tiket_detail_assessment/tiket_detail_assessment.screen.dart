import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_detail_tiket_model.dart';
import 'package:sertidemi/app/data/providers/tiket_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/tiket_detail_assessment/views/tiket_detail_assessment_content_view.dart';

import 'controllers/tiket_detail_assessment.controller.dart';

class TiketDetailAssessmentScreen
    extends GetView<TiketDetailAssessmentController> {
  @override
  final TiketDetailAssessmentController controller =
      Get.put(TiketDetailAssessmentController());

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: appBarDefaultView(title: 'Ticket Detail'),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.assessmentDetailModel.value =
              await TiketProvider.getDetailMyAssessment(
                  idtransaksi: controller.getArguments['idTransaksi']);
        },
        child: FutureBuilder(
          future: TiketProvider.getDetailMyAssessment(
              idtransaksi: controller.getArguments['idTransaksi']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.assessmentDetailModel.value =
                  snapshot.data as AssessmentDetailTiketModel;

              return Stack(children: [
                TiketDetailAssessmentContentView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 186,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Peyedia Sertifikat
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(
                            'Certification Provide by',
                            style: textBold.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: controller.assessmentDetailModel.value!
                                  .contribution!.length,
                              itemBuilder: (context, index) {
                                return imageContribution(controller
                                    .assessmentDetailModel
                                    .value!
                                    .contribution![index]
                                    .icon);
                              },
                            )),
                        const Spacer(),
                        Visibility(
                            visible: (controller.assessmentDetailModel.value!
                                    .statusPengerjaan ==
                                'Y'),
                            child: (controller.assessmentDetailModel.value!
                                        .statusLulus !=
                                    'Sudah Mengerjakan')
                                ?
                                //Buttton Assessment
                                GestureDetector(
                                    onTap: () => controller.onTapAssessment(),
                                    child: Container(
                                      height: 60,
                                      width: Get.width,
                                      color: primaryColor,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Assessment',
                                        style: textBold.copyWith(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  )
                                //Buttton Lihat Hasil
                                : GestureDetector(
                                    onTap: () => controller.onTapResult(),
                                    child: Container(
                                      height: 60,
                                      width: Get.width,
                                      color: primaryColor,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Lihat Hasil',
                                        style: textBold.copyWith(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  )),
                      ],
                    ),
                  ),
                )
              ]);
            } else {
              return Center(child: LoadingView());
            }
          },
        ),
      ),
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
}
