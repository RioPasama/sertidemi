import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/icon_category_view.dart';

import 'controllers/category_certifications.controller.dart';

class CategoryCertificationsScreen
    extends GetView<CategoryCertificationsController> {
  @override
  final CategoryCertificationsController controller =
      Get.put(CategoryCertificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appBarSearch(title: controller.title.value),
        // body: GridView.builder(
        //   itemCount: 14,
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: 120),
        //   itemBuilder: (context, index) {
        //     return IconCategoryView();
        //   },
        // )
        );
  }
}
