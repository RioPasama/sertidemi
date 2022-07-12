import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/home/views/banner_home_view.dart';
import 'package:sertidemi/presentation/home/views/category_home_view.dart';
import 'package:sertidemi/presentation/home/views/list_home_view.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Background AppBar
        Container(
          height: 100,
          width: Get.width,
          color: primaryColor,
        ),

        //Content
        Scaffold(
            appBar: appBarHomeView(),
            body: Stack(
              children: [
                Container(
                  height: 60,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(28))),
                ),
                RefreshIndicator(
                    onRefresh: () => controller.onRefresh(),
                    child: Obx(
                      () => ListView(
                        padding: const EdgeInsets.only(top: 20),
                        children: [
                          //Banner
                          controller.fetchAPIHomeController
                                  .isLoadingHomeBannerModel.value
                              ? loadingHomeBanner()
                              : BannerHomeView(),
                          const SizedBox(height: 20),

                          //Category
                          controller.fetchAPIHomeController
                                  .isLoadingCategoryMaster.value
                              ? loadingHomeCategory()
                              : CategoryHomeView(),
                          const SizedBox(height: 4),

                          //List
                          controller.fetchAPIHomeController
                                  .isLoadingDataHomeListProduct.value
                              ? loadingHomeDataList()
                              : ListHomeView()
                        ],
                      ),
                    )),
              ],
            )),
      ],
    );
  }
}
