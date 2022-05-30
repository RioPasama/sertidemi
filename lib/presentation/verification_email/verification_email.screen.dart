import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/verification_email.controller.dart';

class VerificationEmailScreen extends GetView<VerificationEmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Verifikasi'),
      body: Center(
        child: Text(
          'VerificationEmailScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
