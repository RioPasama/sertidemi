import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/category_master_model.dart';
import 'package:sertidemi/domain/core/extensions/haxColor.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/home/controllers/home.controller.dart';

class CategoryHomeView extends GetView {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Obx(
          () => Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.fetchAPIHomeController.categoryMaster.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemBuilder: (context, index) {
                return cardCategory(
                    data:
                        controller.fetchAPIHomeController.categoryMaster[index],
                    index: index);
              },
            ),
          ),
        ));
  }

  Widget cardCategory({required CategoryMasterModel data, required int index}) {
    return GestureDetector(
      onTap: () => controller.klikContentController
          .onKlikCategory(index: index, option: 2),
      child: SizedBox(
        height: 60,
        width: 180,
        child: Stack(children: [
          Container(
            width: 160,
            margin:
                const EdgeInsets.only(right: 10, left: 10, top: 30, bottom: 10),
            padding: const EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
                color: HexColor.fromHex(data.color!),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(
                  data.judulKategoriMaster!,
                  style: textBold.copyWith(color: Colors.white, fontSize: 20),
                ),
                Text(
                  data.subJudulKategoriMaster!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 68,
                width: 68,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor.fromHex(data.color!)),
                child: imageIcon(data.icon!)),
          )
        ]),
      ),
    );
  }

  Widget imageIcon(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
          );
        });
  }
}
