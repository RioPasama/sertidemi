import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/event_provider.dart';
import 'package:sertidemi/app/views/views/card_length_product_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/presentation/event_list/controllers/event_list.controller.dart';

class EventListContentView extends GetView {
  @override
  final EventListController controller = Get.put(EventListController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          controller.productModel.value = await EventProvider.getListEvent(
              idaEventKategori: controller.getArguments['idkategori']);
        },
        child: FutureBuilder(
          future: EventProvider.getListEvent(
              idaEventKategori: controller.getArguments['idkategori']),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.productModel.value =
                  snapshot.data as List<ProductModel>;
              return Obx(
                () => (controller.productModel.isEmpty)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Lottie.asset(Assets.lottie.emptydatanotfound),
                            const Center(child: Text('Data Not Found'))
                          ])
                    : ListView.builder(
                        itemCount: controller.productModel.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 30),
                        itemBuilder: (context, index) {
                          return CardLengthProductView(
                              data: controller.productModel[index]);
                        },
                      ),
              );
            } else {
              return Center(child: LoadingView());
            }
          },
        ));
  }
}
