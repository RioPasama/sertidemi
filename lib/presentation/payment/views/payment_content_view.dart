import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/payment_method_model.dart';
import 'package:sertidemi/app/data/models/voucher_model.dart';
import 'package:sertidemi/app/data/providers/payment_method_provider.dart';
import 'package:sertidemi/app/data/providers/voucher_provider.dart';
import 'package:sertidemi/app/views/views/card_voucher_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/domain/core/extensions/currencyFormat.extention.dart';
import 'package:sertidemi/domain/core/extensions/formatTime.extension.dart';
import 'package:sertidemi/gen/assets.gen.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/infrastructure/theme/widget_decoration.theme.dart';
import 'package:sertidemi/presentation/payment/controllers/payment.controller.dart';

class PaymentContentView extends GetView {
  @override
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      children: [
        header(),
        const SizedBox(height: 10),
        voucher(),
        paymentMethod()
      ],
    );
  }

  Column paymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih Metode Pembayaran :',
          style: textBold.copyWith(fontSize: 16),
        ),
        FutureBuilder(
          future: PaymentMethodProvider.getListPaymentsMethod(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PaymentMethodModel> paymentMethodModel =
                  snapshot.data as List<PaymentMethodModel>;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: paymentMethodModel.length,
                itemBuilder: (context, index) {
                  return Row(children: [
                    Obx(
                      () => Radio(
                          value: index + 1,
                          groupValue: controller.groupValue.value,
                          onChanged: (value) =>
                              controller.onTapPaymentMethod(value)),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 20),
                    Text(paymentMethodModel[index].metodePayment!)
                  ]);
                },
              );
            } else {
              return Center(child: LoadingView());
            }
          },
        )
      ],
    );
  }

  Column voucher() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Divider(thickness: 2),
      Text(
        'Masukkan Kode Voucher',
        style: textBold.copyWith(fontSize: 16),
      ),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: inputBoxDecorationRounded,
          child: TextField(
              enabled: false,
              decoration: inputInputDecorationRounded.copyWith(
                  hintText: 'Kode Voucher'))),
      Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => Get.bottomSheet(voucherBottomSheet()),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Lihat Voucher Lainnya',
              style: textBold.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      const Divider(thickness: 2)
    ]);
  }

  Stack voucherBottomSheet() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  Text(
                    'Pilih Voucher',
                    style: textBold.copyWith(fontSize: 16),
                  ),
                  FutureBuilder(
                    future: VoucherProvider.getVoucher(
                        id: controller.idProduct.value),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<VoucherModel> voucherModel =
                            snapshot.data as List<VoucherModel>;
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 16),
                          shrinkWrap: true,
                          itemCount: voucherModel.length,
                          itemBuilder: (context, index) {
                            // return CardVoucherView(data: voucherModel[index]);
                            return Text('s');
                          },
                        );
                      } else {
                        return Center(child: LoadingView());
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Assets.icons.close.path)))),
          ),
        ),
      ],
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cardBanner(url: controller.urlBanner.value),
        const SizedBox(height: 8),
        Text(
          controller.title.value,
          style: textBold.copyWith(fontSize: 18),
        ),
        Text(
            '${timeFormatInCard(controller.time.value)}, ${clockFormat(controller.time.value)} WIB'),
        Text(
          currencyRp(controller.price.value),
          style: textBold.copyWith(color: primaryColor),
        ),
      ],
    );
  }

  Widget cardBanner({required String url}) {
    return CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fill)),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: Get.width / 2.8,
            width: Get.width - 68,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
          );
        });
  }
}
