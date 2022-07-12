import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/event_list/views/event_list_app_bar_view.dart';
import 'package:sertidemi/presentation/event_list/views/event_list_content_view.dart';

import 'controllers/event_list.controller.dart';

class EventListScreen extends GetView<EventListController> {
  @override
  final EventListController controller = Get.put(EventListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background
        Container(color: primaryColor),
        SafeArea(child: Container(color: Colors.white)),

        //Content
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SafeArea(child: EventListContentView()),
        ),

        //AppBar
        EventListAppBarView()
      ],
    ));
  }
}
