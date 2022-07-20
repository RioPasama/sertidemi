import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/data/models/list_assessment_certificate_model.dart';
import 'package:sertidemi/app/data/models/list_event_certificate_model.dart';
import 'package:sertidemi/app/data/providers/list_certificate_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/presentation/list_certificate/views/list_assessment_certificate_view.dart';
import 'package:sertidemi/presentation/list_certificate/views/list_event_certificate_view.dart';

import 'controllers/list_certificate.controller.dart';

class ListCertificateScreen extends GetView<ListCertificateController> {
  ListCertificateScreen({Key? key}) : super(key: key);
  @override
  final ListCertificateController controller =
      Get.put(ListCertificateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Certificate'),
      body: (Get.arguments == 1)
          ? FutureBuilder(
              future: ListCertificateProvider.getEventListCertificate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ListEventCertificateModel> listCertificateModel =
                      snapshot.data as List<ListEventCertificateModel>;

                  return (listCertificateModel.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Lottie.asset(Assets.lottie.emptydatanotfound),
                              const Center(child: Text('Data Not Found'))
                            ])
                      : ListEventCertificateView(
                          listCertificateModel: listCertificateModel);
                } else {
                  return Center(child: LoadingView());
                }
              },
            )
          : FutureBuilder(
              future: ListCertificateProvider.getAssessmentListCertificate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ListAssessmentCertificateModel> listCertificateModel =
                      snapshot.data as List<ListAssessmentCertificateModel>;
                  return (listCertificateModel.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Lottie.asset(Assets.lottie.emptydatanotfound),
                              const Center(child: Text('Data Not Found'))
                            ])
                      : ListAssessmentCertificateView(
                          listCertificateModel: listCertificateModel);
                } else {
                  return Center(child: LoadingView());
                }
              },
            ),
    );
  }
}
