import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/event_detail/controllers/event_detail.controller.dart';

class EventDetailContentView extends GetView {
  @override
  final EventDetailController controller = Get.put(EventDetailController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        banner(),
        header(),
        price(),
        description(),
      ],
    );
  }

  Container description() {
    return Container(
      // height: Get.height / 4.8,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //     'Participant Name : ${controller.fetchAPIProductDetailsController.eventDetailModel.value!.namaDaftar!}'),
          // const SizedBox(height: 10),
          Text(controller.fetchAPIProductDetailsController.eventDetailModel
              .value!.deskripsiEvent!),
        ],
      ),
    );
  }

  Padding price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: Text(
              currencyRp(controller.fetchAPIProductDetailsController
                  .eventDetailModel.value!.harga!
                  .toString()),
              style: textBold.copyWith(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.fetchAPIProductDetailsController.eventDetailModel.value!
                .namaEvent!,
            style: textBold.copyWith(fontSize: 18),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.icons.kelender.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Start '),
                  Text('End'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${controller.fetchAPIProductDetailsController.eventDetailModel.value!.eventMulai} WIB'),
                  Text(
                      '${controller.fetchAPIProductDetailsController.eventDetailModel.value!.eventSelesai} WIB'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                Assets.icons.iconPenulis.path,
                scale: 4,
              ),
              const SizedBox(width: 10),
              Text(controller.fetchAPIProductDetailsController.eventDetailModel
                  .value!.penulis!)
            ],
          ),
        ],
      ),
    );
  }

  Widget banner() {
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       (controller.fetchAPIProductDetailsController.eventDetailModel.value!
    //                   .banners!.length >=
    //               1)
    //           ? imagePrimary(controller.fetchAPIProductDetailsController
    //               .eventDetailModel.value!.banners![0].linkBanner!)
    //           : const SizedBox(),
    //       Column(
    //         children: [
    //           (controller.fetchAPIProductDetailsController.eventDetailModel
    //                       .value!.banners!.length >
    //                   1)
    //               ? imageSecond(controller.fetchAPIProductDetailsController
    //                   .eventDetailModel.value!.banners![1].linkBanner!)
    //               : const SizedBox(),
    //           const SizedBox(height: 10),
    //           (controller.fetchAPIProductDetailsController.eventDetailModel
    //                       .value!.banners!.length >
    //                   2)
    //               ? imageSecond(controller.fetchAPIProductDetailsController
    //                   .eventDetailModel.value!.banners![2].linkBanner!)
    //               : const SizedBox(),
    //         ],
    //       )
    //     ],
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Visibility(
        visible: !(controller.fetchAPIProductDetailsController.eventDetailModel
                .value!.banners!.length ==
            0),
        child: SizedBox(
          height: Get.width / 2.8,
          width: Get.width - 150,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.fetchAPIProductDetailsController
                .eventDetailModel.value!.banners!.length,
            itemBuilder: (context, index) {
              return imagePrimary(controller.fetchAPIProductDetailsController
                  .eventDetailModel.value!.banners![0].linkBanner!);
            },
          ),
        ),
      ),
    );
  }

  Widget imagePrimary(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        });
  }

  Widget imageSecond(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 6,
            width: Get.width / 6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 6,
            width: Get.width / 6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 6,
            width: Get.width / 6,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
          );
        });
  }
}
