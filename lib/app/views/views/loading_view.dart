import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends GetView {
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      color: primaryColor,
      size: 50,
    );
  }
}

Widget loadingHomeBanner() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: SizedBox(
      height: Get.width / 2.8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 26),
        children: [
          Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(18),
            ),
          )
        ],
      ),
    ),
  );
}

Widget loadingHomeDataList() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: ListView(shrinkWrap: true, children: [
      Container(
        height: 160,
        width: Get.width,
        color: Colors.grey.shade300,
      ),
      const SizedBox(height: 20),
      Container(
        height: 160,
        width: Get.width,
        color: Colors.grey.shade300,
      )
    ]),
  );
}

Widget loadingHomeCategory() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        children: [
          SizedBox(
            height: 60,
            width: 190,
            child: Stack(
              children: [
                Container(
                  width: 170,
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, top: 40, bottom: 10),
                  padding: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 88,
                    width: 88,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: 190,
            child: Stack(
              children: [
                Container(
                  width: 170,
                  margin: const EdgeInsets.only(
                      right: 10, left: 10, top: 40, bottom: 10),
                  padding: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 88,
                    width: 88,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
