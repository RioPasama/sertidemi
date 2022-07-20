import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/list_transaction_model.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';

class CardListTransactionView extends GetView {
  final ListTransactionModel data;
  final String status;
  const CardListTransactionView(
      {required this.data, required this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_TRANSACTION,
          arguments: {'idTransaksi': data.idtransaksi, 'status': status}),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 2,
                  offset: const Offset(2, 2))
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data.invoice!),
                Text(
                    '${timeFormatInCard(data.inputTanggalTransaksi!)} ${clockFormat(data.inputTanggalTransaksi!)} WIB')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Product'),
                SizedBox(
                    width: Get.width - (16 * 2) - (8 * 2) - 100,
                    child: Text(
                      data.nama!,
                      style: textBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Status'),
                SizedBox(
                    width: Get.width - (16 * 2) - (8 * 2) - 100,
                    child: Text(data.statusTransaksi!))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                SizedBox(
                    width: Get.width - (16 * 2) - (8 * 2) - 222,
                    child: Text(
                      currencyRp(data.totalHargaTicketAkhir!),
                      style: textBold,
                    )),
                Text(
                  'Detail',
                  style: textBold.copyWith(color: primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
