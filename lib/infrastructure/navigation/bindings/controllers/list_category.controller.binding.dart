import 'package:get/get.dart';

import '../../../../presentation/list_category/controllers/list_category.controller.dart';

class ListCategoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListCategoryController>(
      () => ListCategoryController(),
    );
  }
}
