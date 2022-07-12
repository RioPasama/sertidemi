import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/more_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/card_length_product_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

import 'controllers/more.controller.dart';

class MoreScreen extends GetView<MoreController> {
  @override
  final MoreController controller = Get.put(MoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: appBarDefaultView(title: controller.title.value),
        body: FutureBuilder(
          future: MoreProvider.getMoreDataList(
              url: controller.getArguments['url'],
              body: {'tag': controller.getArguments['body']}),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.productModel.value =
                  snapshot.data as List<ProductModel>;
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                itemCount: controller.productModel.length,
                itemBuilder: (context, index) {
                  return CardLengthProductView(
                    data: controller.productModel[index],
                  );
                },
              );
            } else {
              return Center(child: LoadingView());
            }
          },
        )));
  }
}
