import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:sertidemi/app/data/models/list_transaction_model.dart';
import 'package:sertidemi/app/data/providers/list_transaction_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/card_list_transaction_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';
import 'package:sertidemi/gen/assets.gen.dart';

import 'controllers/list_transaction.controller.dart';

class ListTransactionScreen extends GetView<ListTransactionController> {
  ListTransactionScreen({Key? key}) : super(key: key);
  @override
  final ListTransactionController controller =
      Get.put(ListTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDefaultView(title: 'Transaction'),
        body: (Get.arguments == 1)
            ? RefreshIndicator(
                onRefresh: () async {
                  controller.listTransactionModel.value =
                      await ListTransactionProvider
                          .getEventListTransactionModel(
                              GetStorage().read('idUser'));
                },
                child: FutureBuilder(
                  future: ListTransactionProvider.getEventListTransactionModel(
                      GetStorage().read('idUser')),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      controller.listTransactionModel.value =
                          snapshot.data as List<ListTransactionModel>;

                      return Obx(
                        () => (controller.listTransactionModel.isEmpty)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Lottie.asset(
                                        Assets.lottie.emptydatanotfound),
                                    const Center(child: Text('Data Not Found'))
                                  ])
                            : ListView.builder(
                                itemCount:
                                    controller.listTransactionModel.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemBuilder: (context, index) {
                                  return CardListTransactionView(
                                    data:
                                        controller.listTransactionModel[index],
                                    status: 'event',
                                  );
                                },
                              ),
                      );
                    } else {
                      return Center(child: LoadingView());
                    }
                  },
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  controller.listTransactionModel.value =
                      await ListTransactionProvider
                          .getAssessmentListTransactionModel(
                              GetStorage().read('idUser'));
                },
                child: FutureBuilder(
                  future:
                      ListTransactionProvider.getAssessmentListTransactionModel(
                          GetStorage().read('idUser')),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      controller.listTransactionModel.value =
                          snapshot.data as List<ListTransactionModel>;

                      return Obx(
                        () => (controller.listTransactionModel.isEmpty)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Lottie.asset(
                                        Assets.lottie.emptydatanotfound),
                                    const Center(child: Text('Data Not Found'))
                                  ])
                            : ListView.builder(
                                itemCount:
                                    controller.listTransactionModel.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                itemBuilder: (context, index) {
                                  return CardListTransactionView(
                                    data:
                                        controller.listTransactionModel[index],
                                    status: 'assessment',
                                  );
                                },
                              ),
                      );
                    } else {
                      return Center(child: LoadingView());
                    }
                  },
                ),
              ));
  }
}
