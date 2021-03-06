import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/contribution_model.dart';
import 'package:sertidemi/app/data/models/event_model.dart';
import 'package:sertidemi/app/data/providers/contribution_provider.dart';
import 'package:sertidemi/app/data/providers/event_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/event_detail/views/event_detail_content_view.dart';

import 'controllers/tiket_detail_event.controller.dart';

class TiketDetailEventScreen extends GetView<TiketDetailEventController> {
  const TiketDetailEventScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Detail Ticket'),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              controller
                      .fetchAPIProductDetailsController.eventDetailModel.value =
                  await EventProvider.getDetailEvent(
                      idEvent: controller.getArguments['idProduct']);
            },
            child: FutureBuilder(
              future: EventProvider.getDetailEvent(
                  idEvent: controller.getArguments['idProduct']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  controller.fetchAPIProductDetailsController.eventDetailModel
                      .value = snapshot.data as EventDetailModel;

                  return EventDetailContentView();
                } else {
                  return Center(child: LoadingView());
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, -2))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Text(
                      'Certification provide by',
                      style: textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 70,
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
                              return Column(
                                children: [
                                  //Peyedia Event

                                  imageContribution(controller
                                      .fetchAPIProductDetailsController
                                      .contributionModel[index]
                                      .icon),
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(child: LoadingView());
                        }
                      },
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
            height: 50,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration:
                BoxDecoration(image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        });
  }
}
