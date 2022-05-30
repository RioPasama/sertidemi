import 'package:get/get.dart';

import '../../../../presentation/bookshelf/controllers/bookshelf.controller.dart';

class BookshelfControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookshelfController>(
      () => BookshelfController(),
    );
  }
}
