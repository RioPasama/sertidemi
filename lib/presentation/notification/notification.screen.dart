import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Notifikasi'),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
