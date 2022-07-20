import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/klik_content_controller.dart';
import 'package:sertidemi/app/data/models/product_model.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardCoverProductView extends GetView {
  final ProductModel data;
  const CardCoverProductView({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KlikContentController klikContentController =
        Get.put(KlikContentController());

    return GestureDetector(
      onTap: () => klikContentController.onTapCardProduct(
          idProduct: data.idProduct!,
          urlImageCover: data.urlImageCoverKotak!,
          status: data.status!),
      child: Container(
        width: 220,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            CachedNetworkImage(
                imageUrl: data.urlImageCoverKotak!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 120,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill)),
                  );
                },
                placeholder: (context, url) {
                  return Container(
                    height: 120,
                    width: 220,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    height: 120,
                    width: 220,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                  );
                }),
            Container(
              width: 220,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.namaProduct!,
                    style: textBold,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  (data.status == 'event')
                      ? Text(
                          '${timeFormatInCard(data.tanggalMulaiProduct!)} - ${data.tanggalMulaiProduct!.split(' ').last} WIB',
                          style: const TextStyle(fontSize: 12),
                        )
                      : Text(
                          '${timeFormatInCard(data.tanggalMulaiProduct!)} - ${timeFormatInCard(data.tanggalBatasProduct!)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Harga
                      (data.diskon.toString() == '0')
                          ? Text(
                              currencyRp(data.harga!.toString()),
                              style: TextStyle(color: primaryColor),
                            )
                          : Row(
                              children: [
                                Text(currencyRp(data.hargaDiskon!.toString()),
                                    style: TextStyle(color: primaryColor)),
                                Text(' ${data.diskon}%',
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red))
                              ],
                            ),

                      // Visibility(
                      //   visible: data.status == 'event',
                      //   child: Text(
                      //     '1.4rb Terjual',
                      //     style: TextStyle(fontSize: 12, color: Colors.grey),
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget CardCoverProductSertifikasiView() {
  return Container(
    height: 240,
    width: 160,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
    child: Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        ),
        Container(
          height: 80,
          width: 160,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sertifikatsi',
                style: textBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(''),
              Text(
                'Rp. 100.000',
                style: TextStyle(color: primaryColor),
              )
            ],
          ),
        )
      ],
    ),
  );
}
