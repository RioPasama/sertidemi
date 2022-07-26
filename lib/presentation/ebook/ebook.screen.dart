import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/ebook.controller.dart';

class EbookScreen extends GetView<EbookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarSearch(title: 'E-Book', leadingActive: false),
      body: Center(
        child: Text(
          'EbookScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
