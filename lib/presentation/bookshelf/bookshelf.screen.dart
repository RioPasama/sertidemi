import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/bookshelf.controller.dart';

class BookshelfScreen extends GetView<BookshelfController> {
  @override
  final BookshelfController controller = Get.put(BookshelfController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: appBarMultiScreenView(title: 'Rak Buku', tabs: const [
            Tab(text: 'Beli'),
            Tab(text: 'Sewa'),
          ]),
          body: const TabBarView(
            children: [
              Center(child: Text('Beli')),
              Center(child: Text('sewa'))
            ],
          )),
    );
  }
}
