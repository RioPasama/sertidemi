import 'package:get/get.dart';
import 'package:sertidemi/presentation/login/login.screen.dart';
import 'package:sertidemi/presentation/main/controllers/main.controller.dart';
import 'package:sertidemi/app/data/models/login_model.dart';
import 'package:sertidemi/app/data/providers/login_provider.dart';

class AuthenticationController extends GetxController {
  final MainController mainController = Get.put(MainController());

  RxBool isLogin = false.obs;

  void auth() {
    if (!isLogin.value) {
      Future.delayed(Duration.zero, () {
        mainController.selectedIndex.value = 0;
        Get.to(() => LoginScreen());
      });
    }
  }

  void login({required String email, required String password}) async {
    Login resultLogin =
        await LoginProvider().postLogin(email: email, password: email);
  }

  void logOut() {}
}
