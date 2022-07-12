import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardLengthProductView extends StatelessWidget {
  final ProductModel data;
  const CardLengthProductView({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KlikContentController klikContentController =
        Get.put(KlikContentController());
    return GestureDetector(
      onTap: () => klikContentController.onTapCardProduct(
          idProduct: data.idProduct!,
          urlImageCover: data.urlImageCover!,
          status: data.status!),
      child: Container(
        width: Get.width - (16 * 2),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(13),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: data.urlImageCover!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: (Get.width / 2.4) / 2,
                    width: Get.width - (16 * 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill)),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    height: (Get.width / 2.4) / 2,
                    width: Get.width - (16 * 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assetName'), fit: BoxFit.fill)),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    height: (Get.width / 2.4) / 2,
                    width: Get.width - (16 * 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assetName'), fit: BoxFit.fill)),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.namaProduct!,
                    style: textBold.copyWith(fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  (data.status == 'event')
                      ? Text(
                          '${timeFormatInCard(data.tanggalMulaiProduct!)} - ${data.tanggalMulaiProduct!.split(' ').last} WIB')
                      : Text(
                          '${timeFormatInCard(data.tanggalMulaiProduct!)} - ${timeFormatInCard(data.tanggalBatasProduct!)}'),
                  Text(
                    currencyRp(data.harga.toString()),
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
