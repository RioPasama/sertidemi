import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/category_master_model.dart';
import 'package:sertidemi/app/data/providers/category_provider.dart';
import 'package:sertidemi/app/views/views/icon_category_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';

import 'controllers/list_category.controller.dart';

class ListCategoryScreen extends GetView<ListCategoryController> {
  @override
  final ListCategoryController controller = Get.put(ListCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Stack(
        children: [
          Container(color: primaryColor),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          appBarListCategory(),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: GridView.builder(
              itemCount: controller.categoryModel.length,
              padding: const EdgeInsets.only(top: 60),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120),
              itemBuilder: (context, index) {
                return IconCategoryView(
                  data: controller.categoryModel[index],
                  option: controller.getArguments['option'],
                );
              },
            ),
          )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 68),
              child: SizedBox(
                  height: 50,
                  child: FutureBuilder(
                    future: CategoryProvider.getCategoryMaster(
                        tag: controller.tag.value),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        controller.categoryMasterModel.value =
                            snapshot.data as List<CategoryMasterModel>;
                        controller.setSubCategory();
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categoryMasterModel.length,
                          itemBuilder: (context, index) {
                            return cardListCategory(
                                index: index,
                                data: controller.categoryMasterModel[index]);
                          },
                        );
                      } else {
                        return Center(child: LoadingView());
                      }
                    },
                  )),
            ),
          )
        ],
      ),
    ));
  }

  SafeArea appBarListCategory() {
    return SafeArea(
      child: Container(
        height: 90,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(18)),
            color: primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              Visibility(
                  visible: !controller.openSearch.value,
                  child: Text(
                    controller.title.value,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )),
              (controller.openSearch.value)
                  ? Container(
                      height: 40,
                      width: Get.width - (16 * 2) - 40,
                      decoration: inputBoxDecorationRounded,
                      child: TextField(
                        decoration: inputInputDecorationRounded.copyWith(
                            hintText: 'Search',
                            hintStyle: const TextStyle(fontSize: 14),
                            prefixIcon: const Icon(Icons.search_outlined),
                            suffixIcon: GestureDetector(
                                onTap: () => controller.openSearch.toggle(),
                                child: const Icon(Icons.close))),
                        onSubmitted: (value) => controller.onTapSearch(value),
                      ))
                  : IconButton(
                      onPressed: () => controller.openSearch.toggle(),
                      icon: const Icon(Icons.search_outlined),
                      color: Colors.white,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardListCategory(
      {required int index, required CategoryMasterModel data}) {
    return Obx(() => GestureDetector(
          onTap: () => controller.onTapCategoryMaster(index: index),
          child: Container(
            height: 50,
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 40,
              width: Get.width / 2 - (16 * 2),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: (controller.indexCategoryMaster.value == index)
                      ? Colors.white
                      : Colors.grey,
                  border: Border.all(
                      width: 2,
                      color: (controller.indexCategoryMaster.value == index)
                          ? primaryColor
                          : Colors.grey),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ]),
              child: Text(
                data.judulKategoriMaster!,
                style: textBold.copyWith(
                    fontSize: 16,
                    color: (controller.indexCategoryMaster.value == index)
                        ? Colors.black
                        : Colors.black54),
              ),
            ),
          ),
        ));
  }
}
