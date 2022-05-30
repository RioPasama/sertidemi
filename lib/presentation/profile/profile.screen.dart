import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/controllers/authentication_controller.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  final AuthenticationController authenticationControllercontroller =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    authenticationControllercontroller.auth();
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
