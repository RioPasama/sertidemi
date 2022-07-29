import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/detail_transaction/controllers/detail_transaction.controller.dart';

class DetailTransactionContentView extends GetView {
  DetailTransactionContentView({Key? key}) : super(key: key);
  @override
  final DetailTransactionController controller =
      Get.put(DetailTransactionController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        cardDescTransaction(
            statusTransaction:
                controller.detailTransactionModel.value!.statusTransaksi!,
            dateTransaction:
                controller.detailTransactionModel.value!.tanggalInput!,
            noInvoice: controller.detailTransactionModel.value!.invoice!),
        const SizedBox(height: 20),
        cardProduct(
            nameProduct: controller.detailTransactionModel.value!.nama!,
            decs: controller.detailTransactionModel.value!.deskripsi!,
            totalPrice:
                (controller.detailTransactionModel.value!.statusTransaksi ==
                        'Waiting For Payment')
                    ? controller.detailTransactionModel.value!.totalPembayaran!
                    : controller
                        .detailTransactionModel.value!.totalHargaTicketAkhir!,
            priceProduct:
                controller.detailTransactionModel.value!.totalPembayaran!,
            priceVoucher:
                controller.detailTransactionModel.value!.potonganVoucher!,
            url: controller.detailTransactionModel.value!.urlImageKotak!),
        const SizedBox(height: 20),
        Visibility(
            visible:
                (controller.detailTransactionModel.value!.paymentType != ''),
            child: cardInfoPayment(
              paymentType:
                  controller.detailTransactionModel.value!.paymentType!,
              noRek: controller.detailTransactionModel.value!.nomorPayment!,
            )),
        const SizedBox(height: 40)
      ],
    );
  }

  Widget cardInfoPayment({required String paymentType, required String noRek}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Info Payment',
            style: textBold.copyWith(fontSize: 16),
          ),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Metode Pembayaran',
                style: textBold,
              ),
              const Spacer(),
              Text(
                ': ',
                style: textBold,
              ),
              SizedBox(
                width: Get.width / 2 - (10),
                child: Text(paymentType),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No Rekening',
                style: textBold,
              ),
              const Spacer(),
              Text(
                ': ',
                style: textBold,
              ),
              SizedBox(
                width: Get.width / 2 - (10),
                child: Text(noRek),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget cardDescTransaction(
      {required String statusTransaction,
      required String noInvoice,
      required String dateTransaction}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction',
                style: textBold,
              ),
              const Spacer(),
              Text(
                ': ',
                style: textBold,
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(
                  statusTransaction,
                  style: textBold.copyWith(color: Colors.blue),
                ),
              )
            ],
          ),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Number Invoice',
                style: textBold,
              ),
              const Spacer(),
              Text(
                ': ',
                style: textBold,
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(noInvoice),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction Date',
                style: textBold,
              ),
              const Spacer(),
              Text(
                ': ',
                style: textBold,
              ),
              SizedBox(
                width: Get.width / 2,
                child: Text(
                    '${timeFormatInCard(dateTransaction)} ${clockFormat(dateTransaction)} WIB'),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget imageProduct(String url) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: 78,
            width: 142,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
                ],
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: 78,
            width: 142,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
                ]),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: 78,
            width: 142,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
                ]),
          );
        });
  }

  Widget cardProduct(
      {required String nameProduct,
      required String decs,
      required String priceProduct,
      required String totalPrice,
      required String priceVoucher,
      required String url}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Product',
            style: textBold.copyWith(fontSize: 16),
          ),
          const Divider(thickness: 2),
          Row(
            children: [
              imageProduct(url),
              const SizedBox(width: 6),
              SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: Text(
                        nameProduct,
                        style: textBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                        width: Get.width / 2 - (10),
                        child: Text(
                          decs,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const Spacer(),
                    Text(
                      currencyRp(priceProduct),
                      style: textBold.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(thickness: 2),
          Visibility(
            visible: (priceVoucher != '0'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Voucher',
                  style: textBold,
                ),
                Text(
                  '-${currencyRp(priceVoucher)}',
                  style: textBold,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: textBold,
              ),
              Text(
                currencyRp(totalPrice),
                style: textBold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
