import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/payment/views/payment_content_view.dart';

import 'controllers/payment.controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  @override
  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Pembayaran'),
      body: PaymentContentView(),
      bottomSheet: GestureDetector(
        onTap: null,
        child: Container(
          height: 60,
          width: Get.width,
          color: primaryColor,
          alignment: Alignment.center,
          child: Text(
            'Bayar',
            style: textBold.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
