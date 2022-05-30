import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/presentation/certification/views/certification_view.dart';
import 'package:sertidemi/presentation/certification/views/event_view.dart';
import 'controllers/certification.controller.dart';

class CertificationScreen extends GetView<CertificationController> {
  @override
  final CertificationController controller = Get.put(CertificationController());
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    authenticationControllercontroller.auth();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: appBarMultiScreenView(title: 'Sertifikasi', tabs: const [
            Tab(text: 'Event'),
            Tab(text: 'Sertifikasi'),
          ]),
          body: TabBarView(
            children: [EventView(), CertificationView()],
          )),
    );
  }
}
