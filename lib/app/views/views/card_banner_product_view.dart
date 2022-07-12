import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CardBannerProductView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardBannerProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CardBannerProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
