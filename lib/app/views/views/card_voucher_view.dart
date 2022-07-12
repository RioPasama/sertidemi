import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/voucher_model.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardVoucherView extends GetView {
  final VoucherModel data;
  const CardVoucherView({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - (16 * 4),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
          ]),
      child: Row(
        children: [
          cardCover(
              status: data.status!,
              jenisPotongan: data.jenisPotongan!,
              nilaiPotongan: data.nilaiPotongan!),
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
                      ' Berlaku Hinga ${timeFormatInCard(data.masaAktifVoucher!)}',
                      style: TextStyle(color: primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.status!.toUpperCase(),
                        style: TextStyle(color: primaryColor),
                      ),
                      OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: primaryColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Pakai',
                            style: TextStyle(color: primaryColor),
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container cardCover(
      {required String status,
      required String jenisPotongan,
      required String nilaiPotongan}) {
    return Container(
      height: 112,
      width: 112,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: (status == 'event') ? Colors.red : Colors.green,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
          ]),
      child: (jenisPotongan == 'RUPIAH')
          ? rupiah(nilaiPotongan)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Diskon',
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
            ),
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
            'Diskon',
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
            '${nilaiPotongan.replaceAll('000', '0')} rb',
            style: textBold.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
