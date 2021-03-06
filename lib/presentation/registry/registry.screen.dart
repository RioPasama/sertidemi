import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import './views/form_registry_view.dart';
import './views/image_profile_view.dart';

import 'controllers/registry.controller.dart';

class RegistryScreen extends GetView<RegistryController> {
  @override
  final RegistryController controller = Get.put(RegistryController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Get.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.loginGambarCrop.path))),
          ),
        ),
        Container(color: Colors.white.withOpacity(0.8)),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'Sign Up',
              style: TextStyle(color: primaryColor),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: Get.height - 80,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Get.height / 1.22,
                        width: double.maxFinite,
                        padding: const EdgeInsets.fromLTRB(16, 100, 16, 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        child: FormRegistryView(),
                      ),
                    ),
                    ImageProfileView()
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
