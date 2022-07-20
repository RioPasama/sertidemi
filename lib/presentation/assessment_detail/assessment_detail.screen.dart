import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_model.dart';
import 'package:sertidemi/app/data/models/contribution_model.dart';
import 'package:sertidemi/app/data/providers/assessment_provider.dart';
import 'package:sertidemi/app/data/providers/contribution_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/assessment_detail/views/assessment_detail_content_view.dart';

import 'controllers/assessment_detail.controller.dart';

class AssessmentDetailScreen extends GetView<AssessmentDetailController> {
  @override
  final AssessmentDetailController controller =
      Get.put(AssessmentDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Detail Certification'),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              controller.fetchAPIProductDetailsController.assessmentDetailModel
                      .value =
                  await AssessmentProvider.getDetailAssesment(
                      idAssessment: controller.getArguments['idProduct']);
            },
            child: FutureBuilder(
              future: AssessmentProvider.getDetailAssesment(
                  idAssessment: controller.getArguments['idProduct']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  controller
                      .fetchAPIProductDetailsController
                      .assessmentDetailModel
                      .value = snapshot.data as AssessmentDetailModel;

                  return AssessmentDetailContentView();
                } else {
                  return Center(child: LoadingView());
                }
              },
            ),
          ),
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
                    height: 85,
                    child: FutureBuilder(
                      future: ContributionProvider.getListContribution(
                          id: controller.getArguments['idProduct']),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          controller
                              .fetchAPIProductDetailsController
                              .contributionModel
                              .value = snapshot.data as List<ContributionModel>;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: controller
                                .fetchAPIProductDetailsController
                                .contributionModel
                                .length,
                            itemBuilder: (context, index) {
                              return imageContribution(controller
                                  .fetchAPIProductDetailsController
                                  .contributionModel[index]
                                  .icon);
                            },
                          );
                        } else {
                          return Center(child: LoadingView());
                        }
                      },
                    ),
                  ),
                  const Spacer(),
                  //Buttton Assessment
                  GestureDetector(
                    onTap: () => controller.onTapRegistry(),
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
                  ),
                ],
              ),
            ),
          )
        ],
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
