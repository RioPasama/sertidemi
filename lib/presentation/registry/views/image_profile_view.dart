import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/registry/controllers/registry.controller.dart';

class ImageProfileView extends GetView {
  @override
  final RegistryController controller = Get.put(RegistryController());

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: Get.height / 6,
          width: Get.height / 6,
          child: Stack(
            children: [
              Obx(
                () => Container(
                  height: Get.height / 6,
                  width: Get.height / 6,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 6),
                      image: DecorationImage(
                          image: (!controller.isInputImage.value)
                              ? AssetImage(Assets.images.imgDefaul.assetName)
                              : FileImage(File(controller.image!.path))
                                  as ImageProvider,
                          fit: BoxFit.cover)),
                ),
              ),
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
                  ))
            ],
          ),
        ));
  }
}
