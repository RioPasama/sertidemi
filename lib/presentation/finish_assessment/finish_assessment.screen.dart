import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/finish_assessment/views/finish_assessment_content_view.dart';

import 'controllers/finish_assessment.controller.dart';

class FinishAssessmentScreen extends GetView<FinishAssessmentController> {
  FinishAssessmentScreen({Key? key}) : super(key: key);

  @override
  final FinishAssessmentController controller =
      Get.put(FinishAssessmentController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN);
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Get.offAllNamed(Routes.MAIN),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.grey,
                )),
          ),
          body: Stack(
            children: [
              FinishAssessmentContentView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => controller.onTapShare(),
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: Text(
                      'Bagikan',
                      style:
                          textBold.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
