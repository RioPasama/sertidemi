import 'package:get/get.dart';

import '../../../../presentation/change_profile/controllers/change_profile.controller.dart';

class ChangeProfileControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeProfileController>(
      () => ChangeProfileController(),
    );
  }
}
