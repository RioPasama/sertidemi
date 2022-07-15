import 'package:get/get.dart';

import '../../../../presentation/home_search/controllers/home_search.controller.dart';

class HomeSearchControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSearchController>(
      () => HomeSearchController(),
    );
  }
}
