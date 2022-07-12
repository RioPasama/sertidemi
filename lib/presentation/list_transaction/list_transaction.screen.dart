import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sertidemi/app/data/models/list_transaction_model.dart';
import 'package:sertidemi/app/data/providers/list_transaction_provider.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';
import 'package:sertidemi/app/views/views/card_list_transaction_view.dart';
import 'package:sertidemi/app/views/views/loading_view.dart';

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
            ? Center(
                child: Text(
                  'Coming Soon',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : FutureBuilder(
                future:
                    ListTransactionProvider.getAssessmentListTransactionModel(
                        GetStorage().read('idUser')),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ListTransactionModel> listTransactionModel =
                        snapshot.data as List<ListTransactionModel>;

                    return ListView.builder(
                      itemCount: listTransactionModel.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return CardListTransactionView(
                            data: listTransactionModel[index]);
                      },
                    );
                  } else {
                    return Center(child: LoadingView());
                  }
                },
              ));
  }
}
