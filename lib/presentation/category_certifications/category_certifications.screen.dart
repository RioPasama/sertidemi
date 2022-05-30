import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/category_certifications.controller.dart';

class CategoryCertificationsScreen
    extends GetView<CategoryCertificationsController> {
  @override
  final CategoryCertificationsController controller =
      Get.put(CategoryCertificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSearchCategory(title: controller.title.value),
      body: Center(
        child: Text(
          'CategoryCertificationsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
