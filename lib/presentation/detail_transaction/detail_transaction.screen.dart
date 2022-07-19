import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/data/models/detail_transaction_model.dart';
import 'package:sertidemi/app/data/providers/detail_transaction_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/infrastructure/theme/colors.theme.dart';
import 'package:sertidemi/infrastructure/theme/fonts.theme.dart';
import 'package:sertidemi/presentation/detail_transaction/views/detail_transaction_content_view.dart';

import 'controllers/detail_transaction.controller.dart';

class DetailTransactionScreen extends GetView<DetailTransactionController> {
  DetailTransactionScreen({Key? key}) : super(key: key);
  @override
  final DetailTransactionController controller =
      Get.put(DetailTransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Detail Transaction'),
      body: FutureBuilder(
        future: (controller.getArguments['status'] == 'assessment')
            ? DetailTransactionProvider.getAssessmentDetailTransaction(
                controller.getArguments['idTransaksi'])
            : DetailTransactionProvider.getEventDetailTransaction(
                controller.getArguments['idTransaksi']),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.detailTransactionModel.value =
                snapshot.data as DetailTransactionModel;
            return DetailTransactionContentView();
          } else {
            return Center(child: LoadingView());
          }
        },
      ),
      bottomSheet: GestureDetector(
        onTap: () => controller.onTapBottomSheet(),
        child: Container(
          height: 44,
          width: Get.width,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: primaryColor),
          child: Text(
            'View receipt',
            style: textBold.copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
