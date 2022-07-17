import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/status_transaction/controllers/status_transaction.controller.dart';

class StatusTransactionContentView extends GetView {
  @override
  final StatusTransactionController controller =
      Get.put(StatusTransactionController());

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: controller.globalKey,
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Transaction Success',
                  style: textBold.copyWith(fontSize: 18),
                ),
              ),
              Image.asset(
                Assets.images.vektorTransaksiBerhasil.path,
                scale: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icons.kelender.path,
                    scale: 4,
                  ),
                  Text(
                      ' ${timeFormatInCard(controller.statusTransactionModel.createdAt!)} '),
                  Image.asset(
                    Assets.icons.transaksiJam.path,
                    scale: 4,
                  ),
                  Text(
                      ' ${clockFormat(controller.statusTransactionModel.createdAt!)} WIB')
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26),
                child: Divider(thickness: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.icons.transaksiNoInvoice.path,
                    scale: 4,
                  ),
                  Text(' ${controller.statusTransactionModel.noInvoice!}')
                ],
              ),
              Container(
                height: 200,
                width: Get.width - (16 * 2),
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            Assets.images.transaksiBGDetailTransaksi.path),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Text(
                      controller.nameOption.value,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                    ),
                    Text(
                      controller.statusTransactionModel.namaProduct!,
                      style: textBold.copyWith(fontSize: 18),
                      maxLines: 2,
                    ),
                    Text(controller.statusTransactionModel.metodePembayaranal!,
                        style: textBold),
                    const SizedBox(height: 40),
                    const Text(
                      'Total of payment',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      currencyRp(controller.statusTransactionModel.total!),
                      style: textBold,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
