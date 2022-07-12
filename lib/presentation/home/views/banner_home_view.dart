import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/home_banner_model.dart';
import 'package:sertidemi/presentation/home/controllers/home.controller.dart';

class BannerHomeView extends GetView {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.fetchAPIHomeController.homeBannerModel.length != 0,
        child: SizedBox(
          height: Get.width / 2.8,
          child: ListView.builder(
            itemCount: controller.fetchAPIHomeController.homeBannerModel.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            itemBuilder: (context, index) {
              return cardBanner(
                  controller.fetchAPIHomeController.homeBannerModel[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget cardBanner(HomeBannerModel data) {
    return CachedNetworkImage(
        imageUrl: data.imageBanner!,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        });
  }
}
