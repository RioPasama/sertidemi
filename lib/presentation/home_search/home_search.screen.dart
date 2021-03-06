import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/views/views/card_cover_product_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';

import 'controllers/home_search.controller.dart';

class HomeSearchScreen extends GetView<HomeSearchController> {
  const HomeSearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(controller.onScroll);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(), child: const Icon(Icons.close_rounded)),
          title: Container(
            height: 40,
            width: Get.width - 68,
            decoration: inputBoxDecorationRounded,
            child: TextField(
              autofocus: true,controller: controller.searchTextEditingController,
              decoration: inputInputDecorationRounded.copyWith(
                hintText: 'Search',
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: const Icon(Icons.search_outlined),
              ),
              onSubmitted: (value) => controller.onSubmitted(value),
            ),
          ),
        ),
        body: Obx(() => ((controller.productModel.isEmpty)
            ? (controller.isSearch.value)
                ? Column(
                    children: [
                      Center(
                          child: Lottie.asset(Assets.lottie.emptydatanotfound)),
                      const Center(child: Text('Data Not Found'))
                    ],
                  )
                : const Center(child: Text('Searching...'))
            : GridView.builder(
                controller: controller.scrollController,
                itemCount: controller.productModel.length,
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 350, mainAxisExtent: 200),
                itemBuilder: (context, index) {
                  return CardCoverProductView(
                      data: controller.productModel[index]);
                },
              ))));
  }
}
