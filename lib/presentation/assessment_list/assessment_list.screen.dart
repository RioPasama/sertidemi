import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/assessment_list/views/assessment_list_app_bar_view.dart';
import 'package:sertidemi/presentation/assessment_list/views/assessment_list_content_view.dart';

import 'controllers/assessment_list.controller.dart';

class AssessmentListScreen extends GetView<AssessmentListController> {
  @override
  final AssessmentListController controller =
      Get.put(AssessmentListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      //background
      Container(color: primaryColor),
      SafeArea(child: Container(color: Colors.white)),

      //Content
      Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SafeArea(child: AssessmentListContentView()),
      ),

      //AppBar
      AssessmentListAppBarView()
    ]));
  }
}
