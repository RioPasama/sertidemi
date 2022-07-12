import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/app/data/providers/home_provider.dart';
import 'package:sertidemi/app/views/views/card_cover_product_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/presentation/home/controllers/home.controller.dart';

class ListHomeView extends GetView {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        list(data: controller.fetchAPIHomeController.dataHomeListProduct),
        const SizedBox(height: 80)
      ],
    );
  }

  Widget list({required List<FetchModel> data}) {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                //Background List
                Container(
                  height: 160,
                  color: primaryColor,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index].nama!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          GestureDetector(
                            onTap: () => controller.onKlikMore(
                                name: data[index].nama!, url: data[index].url!),
                            child: SizedBox(
                              child: Row(
                                children: const [
                                  Text(
                                    'Lainnya',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 210, child: cardList(data: data[index].data!)),
                  ],
                )
              ],
            );
          },
        ));
  }

  Widget cardList({required List<ProductModel> data}) {
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 26),
      itemBuilder: (context, index) {
        return CardCoverProductView(data: data[index]);
      },
    );
  }
}
