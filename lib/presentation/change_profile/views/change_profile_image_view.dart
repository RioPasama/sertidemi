import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/change_profile/controllers/change_profile.controller.dart';

class ChangeProfileImageView extends GetView {
  ChangeProfileImageView({Key? key}) : super(key: key);

  @override
  final ChangeProfileController controller = Get.put(ChangeProfileController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: Get.height / 6,
        width: Get.height / 6,
        child: Stack(children: [
          Obx(
            () => (controller.isInputImage.value)
                ? Container(
                    height: Get.height / 6,
                    width: Get.height / 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 6),
                        image: DecorationImage(
                            image: FileImage(File(controller.image!.path)),
                            fit: BoxFit.cover)),
                  )
                : imageProfile(controller
                    .authenticationControllercontroller.urlImageUser.value),
          ),

          //Button edit Image
          Align(
            alignment: Alignment.bottomRight,
            child: Obx(
              () => (controller.isInputImage.value)
                  ? IconButton(
                      onPressed: () async {
                        controller.image = null;
                        controller.isInputImage.value = false;
                      },
                      icon: Container(
                        height: 58,
                        width: 58,
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ))
                  : IconButton(
                      onPressed: () async {
                        controller.image = (await controller.getImage());
                      },
                      icon: Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      )),
            ),
          )
        ]),
      ),
    );
  }

  Widget imageProfile(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image: DecorationImage(
                    image: AssetImage(Assets.images.imgDefaul.path))),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.height / 6,
            width: Get.height / 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 6),
                image: DecorationImage(
                    image: AssetImage(Assets.images.imgDefaul.path))),
          );
        });
  }
}
