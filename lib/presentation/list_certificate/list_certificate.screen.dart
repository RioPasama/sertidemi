import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_certificate_model.dart';
import 'package:sertidemi/app/data/providers/list_certificate_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/presentation/list_certificate/views/list_certificate_content_view.dart';

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
          ? Center(
              child: Text(
                'Coming Soon',
                style: TextStyle(fontSize: 20),
              ),
            )
          : FutureBuilder(
              future: ListCertificateProvider.getListCertificate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ListCertificateModel> listCertificateModel =
                      snapshot.data as List<ListCertificateModel>;
                  return ListCertificateContentView(
                      listCertificateModel: listCertificateModel);
                } else {
                  return Center(child: LoadingView());
                }
              },
            ),
    );
  }
}
