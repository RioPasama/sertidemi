import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_voucher_all_product_model.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

Widget cardMyVoucherAllProductView(ListVoucherAllProductModel data) {
  return Container(
    width: Get.width - (16 * 4),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
        ]),
    child: Row(children: [
      cardCover(data),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.namaVoucher!, style: textBold),
              Text(data.deskripsiVoucher!),
              Row(
                children: [
                  Image.asset(
                    Assets.icons.kelender.path,
                    scale: 4,
                  ),
                  Text(
                    ' Valid until ${timeFormatInCard(data.tanggalSelesai!)}',
                    style: TextStyle(color: primaryColor),
                  )
                ],
              )
            ],
          ))
    ]),
  );
}

Container cardCover(ListVoucherAllProductModel data) {
  return Container(
    height: 112,
    width: 112,
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
        color: const Color(0xFF3E8AB4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
        ]),
    child: (data.jenisPotongan! == 'RUPIAH')
        ? rupiah(data.nilaiPotongan!)
        : persen(data.nilaiPotongan!),
  );
}

Column persen(String nilaiPotongan) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Spacer(),
      const Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Discount',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const Spacer(),
      Align(
        alignment: Alignment.topCenter,
        child: Text(
          '$nilaiPotongan%',
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
      const Spacer()
    ],
  );
}

Column rupiah(String nilaiPotongan) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Spacer(),
      const Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Discount',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const Spacer(),
      const Text(
        'Rp.',
        style: TextStyle(color: Colors.white),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Text(
          '${nilaiPotongan.replaceAll('000', '')} rb',
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
      ),
      const Spacer()
    ],
  );
}
