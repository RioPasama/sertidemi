import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/assessment_provider.dart';
import 'package:sertidemi/app/views/views/card_length_product_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/presentation/assessment_list/controllers/assessment_list.controller.dart';

class AssessmentListContentView extends GetView {
  @override
  final AssessmentListController controller =
      Get.put(AssessmentListController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          controller.productModel.value =
              await AssessmentProvider.getListAssesment(
                  idaAssessmentKategori: controller.getArguments['idkategori']);
        },
        child: FutureBuilder(
          future: AssessmentProvider.getListAssesment(
              idaAssessmentKategori: controller.getArguments['idkategori']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.productModel.value =
                  snapshot.data as List<ProductModel>;
              if (controller.productModel.isEmpty) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(Assets.lottie.emptydatanotfound),
                      const Center(child: Text('Data Not Found'))
                    ]);
              } else {
                return Obx(() => ListView.builder(
                      itemCount: controller.productModel.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 30),
                      itemBuilder: (context, index) {
                        return CardLengthProductView(
                            data: controller.productModel[index]);
                      },
                    ));
              }
            } else {
              return Center(child: LoadingView());
            }
          },
        ));
  }
}
