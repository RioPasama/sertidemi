import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sertidemi/app/views/views/appbar_view.dart';

import 'controllers/edit_profile.controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultView(title: 'Ubah Data'),
      body: Center(
        child: Text(
          'EditProfileScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
