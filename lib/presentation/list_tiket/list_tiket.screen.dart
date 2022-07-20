import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/assessment_tiket_model.dart';
import 'package:sertidemi/app/data/models/event_tiket_model.dart';
import 'package:sertidemi/app/data/providers/tiket_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/card_tiket_assessment_view.dart';
import 'package:sertidemi/app/views/views/card_tiket_event_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

import 'controllers/list_tiket.controller.dart';

class ListTiketScreen extends GetView<ListTiketController> {
  ListTiketScreen({Key? key}) : super(key: key);
  @override
  final ListTiketController controller = Get.put(ListTiketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'Ticket'),
        body: (Get.arguments == 1)
            ? FutureBuilder(
                future: TiketProvider.getMyEvent(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<EventTiketModel> eventTiketModel =
                        snapshot.data as List<EventTiketModel>;
                    return ListView.builder(
                      itemCount: eventTiketModel.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return CardTiketEventView(
                            eventTiketModel: eventTiketModel[index]);
                      },
                    );
                  } else {
                    return Center(child: LoadingView());
                  }
                },
              )
            : FutureBuilder(
                future: TiketProvider.getMyAssessment(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<AssessmentTiketModel> assessmentTiketModel =
                        snapshot.data as List<AssessmentTiketModel>;
                    return ListView.builder(
                      itemCount: assessmentTiketModel.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return CardTiketAssessmentView(
                            assessmentTiketModel: assessmentTiketModel[index]);
                      },
                    );
                  } else {
                    return Center(child: LoadingView());
                  }
                },
              ));
  }
}
