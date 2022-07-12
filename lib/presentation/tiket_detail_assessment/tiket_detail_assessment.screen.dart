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
      appBar: appBarDefaultView(title: 'Detail Tiket'),
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
              controller.loadListMateri();

              return SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    TiketDetailAssessmentContentView(),
                    const Spacer(),
                    Visibility(
                        visible: (controller.assessmentDetailModel.value!
                                .statusPengerjaan ==
                            'Y'),
                        child: (controller
                                    .assessmentDetailModel.value!.statusLulus !=
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
                              ))
                  ],
                ),
              );
            } else {
              return Center(child: LoadingView());
            }
          },
        ),
      ),
    );
  }
}
