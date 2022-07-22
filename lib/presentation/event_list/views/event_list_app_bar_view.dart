import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/event_list/controllers/event_list.controller.dart';

class EventListAppBarView extends GetView {
  @override
  final EventListController controller = Get.put(EventListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: 90,
            width: Get.width,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(18))),
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon:
                        const Icon(Icons.arrow_back_ios, color: Colors.white)),
                Text(
                  'Event ${controller.getArguments['title']}',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(width: 48)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
            child: Container(
              height: 40,
              width: Get.width - (16 * 2),
              decoration: inputBoxDecorationRounded.copyWith(boxShadow: const [
                BoxShadow(
                    color: Colors.black54, blurRadius: 4, offset: Offset(0, 2))
              ]),
              child: TextField(
                controller: controller.search,
                decoration: inputInputDecorationRounded.copyWith(
                    hintText: 'Search',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search_outlined),
                    suffixIcon: Obx(() => controller.isSearch.value
                        ? GestureDetector(
                            onTap: () => controller.onRessetSearch(),
                            child: const Icon(Icons.close))
                        : const SizedBox())),
                onSubmitted: (value) {
                  controller.onTapSearch(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
