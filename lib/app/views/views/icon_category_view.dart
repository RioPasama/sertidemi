import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/app/data/models/category_model.dart';

class IconCategoryView extends StatelessWidget {
  final CategoryModel data;
  final int option;
  const IconCategoryView({required this.data, required this.option, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KlikContentController klikContentController =
        Get.put(KlikContentController());
    return GestureDetector(
      onTap: () => klikContentController.onTapIconCategroy(
          idkategori: data.idkategori!,
          title: data.namakategori!,
          option: option),
      child: Column(children: [
        image(data.icon!),
        SizedBox(
            width: 60,
            child: Text(
              data.namakategori!,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ))
      ]),
    );
  }

  Widget image(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          );
        });
  }
}
