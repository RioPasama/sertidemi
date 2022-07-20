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

import 'controllers/event_detail.controller.dart';

class EventDetailScreen extends GetView<EventDetailController> {
  @override
  final EventDetailController controller = Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Event Detail'),
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
              height: 186,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Text(
                      'Certification provide by',
                      style: textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 86,
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
                  const Spacer(),
                  //Buttton Acara
                  GestureDetector(
                    onTap: () => controller.onTapRegistry(),
                    child: Container(
                      height: 60,
                      width: Get.width,
                      color: primaryColor,
                      alignment: Alignment.center,
                      child: Text(
                        'Registry',
                        style: textBold.copyWith(
                            color: Colors.white, fontSize: 16),
                      ),
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
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration:
                BoxDecoration(image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(color: Colors.grey),
          );
        });
  }
}
