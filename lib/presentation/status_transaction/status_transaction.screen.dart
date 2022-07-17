import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/infrastructure/navigation/routes.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/status_transaction/views/status_transaction_content_view.dart';

import 'controllers/status_transaction.controller.dart';

class StatusTransactionScreen extends GetView<StatusTransactionController> {
  @override
  final StatusTransactionController controller =
      Get.put(StatusTransactionController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.MAIN);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Get.offAllNamed(Routes.MAIN),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: Stack(
          children: [
            StatusTransactionContentView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () => controller.onTapShare(),
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Text(
                    'Share',
                    style: textBold.copyWith(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
