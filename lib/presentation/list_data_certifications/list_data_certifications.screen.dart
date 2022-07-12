import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/list_data_certifications.controller.dart';

class ListDataCertificationsScreen
    extends GetView<ListDataCertificationsController> {
  @override
  final ListDataCertificationsController controller =
      Get.put(ListDataCertificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSearch(title: controller.title.value),
      body: Center(
        child: Text(
          'ListDataCertificationsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
